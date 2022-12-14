import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:config/Config.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/logging/logger.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/client/mock_network_client.dart';
import 'package:network_manager/client/network_client_base.dart';
import 'package:network_manager/global_control/global_control_notifier.dart';
import 'package:network_manager/global_control/model/configuration/config.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/required_header/required_headers_generator.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/graphql/network_graphql_response.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:network_manager/model/status/http_status.dart';
import 'package:network_manager/utils/connectivity/i_connectivity.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:widget_library/utils/app_utils.dart';
class _Constants {
  static const String graphQLDefaultEndpointName = 'default';
}

class NetworkClient extends NetworkClientBase implements INetworkClient {
  final http.Client _httpClient;
  late Map<String, dynamic> _graphQLClients;
  late Config config;
  final IAuthManager _authManager;
  final RequiredHeadersGenerator _requiredHeadersGenerator;

  NetworkClient(
    this._httpClient,
    IConnectivity connectivityListener,
    GlobalControlNotifier globalControlNotifier,
    this._authManager,
    this._requiredHeadersGenerator,
  ) : super(
          _httpClient,
          connectivityListener,
          globalControlNotifier,
        );

  HttpClientWithMiddleware httpClient = HttpClientWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY,),
  ],);

  @override
  void initializeGraphQlClient({
    required Config config,
    required String accessToken,
    required Map<String, String> headers,
  }) async {
    this.config = config;
    final certificateBytes = getCertificateBytes();
    _graphQLClients = {};

    for (var env in config.gqlEnvironments) {
      if (env.name == 'mock') {
        _graphQLClients[env.name] = MockNetworkClient();
      } else {
        // pin certificate to client
        final context = SecurityContext();

        context.setTrustedCertificatesBytes(certificateBytes);
        final httpClient = HttpClient(context: context);
        final iocClient = IOClient(httpClient);

        final requiredHeadersModel =
            await _requiredHeadersGenerator.returnRequiredHeaders();
        // create http link
        final httpLink = HttpLink(
          env.host,
          defaultHeaders: <String, String>{}
            ..addAll(requiredHeadersModel.toJson())
            ..addAll(headers)
            ..addAll(env.headers ?? {}),
          httpClient: iocClient,
        );

        final authLink = AuthLink(
          getToken: () async {
            final accessTokenValue = await _authManager.getAccessToken();
            return accessTokenValue.isNullOrEmpty()
                ? await _getStaticAuth
                : accessTokenValue;
          },
        ).concat(httpLink);

        _graphQLClients[env.name] = GraphQLClient(
          link: authLink,
          cache: GraphQLCache(),
        );
      }
    }

    // Check that we have a default GraphQL endpoint configured
    assert(
      _graphQLClients.isNotEmpty &&
          _graphQLClients.containsKey(_Constants.graphQLDefaultEndpointName),
      'There is no "${_Constants.graphQLDefaultEndpointName} GraphQLEndpoint configured in the network config',
    );
  }

  Future<String> get _getStaticAuth async {
    final result =
        await DIContainer.container.resolve<IAuthManager>().getAccessToken();
    if (result == null) {
      return 'error';
    } else {
      return result;
    }
  }

  @override
  Future<NetworkStandardResponse> standardRequest(
    StandardRequest request,
  ) async {
    if (!hasInternet) {
      CrayonPaymentLogger.logInfo<NetworkClient>(
        'No active internet connection.',
      );
      return NetworkStandardResponse(
        '',
        HttpStatus.noConnectionToInternet,
        <String, String>{},
      );
    }
    switch (request.requestType) {
      case RequestType.GET:
        return await _standardGetRequest(request);
      case RequestType.POST:
        return await _standardPostRequest(request);
      case RequestType.PUT:
        return await _standardPutRequest(request);
      default:
        throw Exception(
          'The type passed to standard request is not a standard request type',
        );
    }
  }

  Future<NetworkStandardResponse> _standardGetRequest(
    StandardRequest request,
  ) async {
    CrayonPaymentLogger.logInfo<NetworkClient>(
      'Making a standard get request to the network for'
      ' env: ${currentEnvironment.name}',
    );
    Uri uri;
    if (currentEnvironment.name == 'Local') {
      uri = Uri.http(
        currentEnvironment.host,
        request.endpoint,
        request.uriParameters,
      );
    } else if (request.endpoint.contains('[customer]')) {
      uri = Uri.parse(
        request.endpoint.replaceAll('[customer]', ''),
      );
    } else {
      uri = Uri.parse(
        '${currentEnvironment.host}${request.endpoint}',
      );
    }

    if (_getStaticAuth != 'error') {
      _getStaticAuth.then((value) {
        request.customHeaders = {
          'Authorization': value,
          'Content-Type': 'application/json',
        };
        CrayonPaymentLogger.logInfo(value);
      });
    }
    request.customHeaders = await request.headers();
    print(request.customHeaders.toString());

    final headers = buildHeaders(request.customHeaders);
    CrayonPaymentLogger.logDebug<NetworkClient>(
      'Sending GET request to the server for url: ${uri.toString()}',
    );
    try {
      var getRequest = http.Request('GET', uri);
      if (request.jsonBody != null) {
        getRequest.body = request.jsonBody!;
      }
      getRequest.headers.addAll(headers!);
      final streamedResponse = await getRequest.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 401) {
        var res = json.decode(response.body);
        if(res['message'].contains("Full authentication is required to access this resource")){
          print("Session Expired so logout the user");
          return _logoutUser();
        }
      }
      if (response.statusCode == 500) {
        return _internalServerMessage();
      }if (response.statusCode == 404) {
        return NetworkStandardResponse(
          response.body,
          response.statusCode,
          response.headers,
        );
      }
      if (response.statusCode != 200) {
        var res = json.decode(response.body);
        if (res['message'] != null) {
          throw res['message'];
        } else {
          throw 'Something went wrong';
        }
      }
      return NetworkStandardResponse(
        response.body,
        response.statusCode,
        response.headers,
      );
    } on Exception catch (e) {
      return NetworkStandardResponse(
        e.toString(),
        HttpStatus.badRequest,
        <String, String>{},
      );
    }
  }

  Future<NetworkStandardResponse> _standardPostRequest(
    StandardRequest request,
  ) async {
    CrayonPaymentLogger.logInfo<NetworkClient>(
      'Making a standard post request to the network'
      ' for env: ${currentEnvironment.name}',
    );
    Uri uri;
    if (currentEnvironment.name == 'Local') {
      uri = Uri.parse('http://' + currentEnvironment.host + request.endpoint);
    } else if (request.endpoint.contains('[customer]')) {
      uri = Uri.parse(
        request.endpoint.replaceAll('[customer]', ''),
      );
    } else {
      uri = Uri.parse(currentEnvironment.host + request.endpoint);
    }

    if (_getStaticAuth != 'error') {
      _getStaticAuth.then((value) {
        request.customHeaders = {
          'Authorization': value,
          'Content-Type': 'application/json',
        };
      });
    }
    request.customHeaders = await request.headers();

    print(request.customHeaders.toString());
    final headers = buildHeaders(request.customHeaders);
    CrayonPaymentLogger.logDebug<NetworkClient>(
      'Sending POST request to the server for url: ${uri.toString()}',
    );
    final response =
        await httpClient .post(uri, headers: headers, body: request.jsonBody);
    print(response.body);
    if (response.statusCode == 401) {
      var res = json.decode(response.body);
      if(res['message'].contains("Full authentication is required to access this resource")){
        print("Session Expired so navigate to logout");
        return _logoutUser();
      }
    }
    if (response.statusCode == 500) {
      return _internalServerMessage();
    }
    if (response.statusCode == 404) {
      return NetworkStandardResponse(
        response.body,
        response.statusCode,
        response.headers,
      );
    }
    if (response.statusCode == 400) {
      return NetworkStandardResponse(
        response.body,
        response.statusCode,
        response.headers,
      );
    }
    if (response.statusCode == 409) {
      return NetworkStandardResponse(
        response.body,
        response.statusCode,
        response.headers,
      );
    }
    if (response.statusCode != 200) {
      var res = json.decode(response.body);
      if (res['message'] != null) {
        throw res['message'];
      } else {
        throw 'Something went wrong';
      }
    }
    return NetworkStandardResponse(
      response.body,
      response.statusCode,
      response.headers,
    );
  }

  Future<NetworkStandardResponse> _standardPutRequest(
    StandardRequest request,
  ) async {
    CrayonPaymentLogger.logInfo<NetworkClient>(
      'Making a standard post request to the network'
      ' for env: ${currentEnvironment.name}',
    );
    Uri uri;
    if (currentEnvironment.name == 'Local') {
      uri = Uri.parse('http://' + currentEnvironment.host + request.endpoint);
    } else if (request.endpoint.contains('[customer]')) {
      uri = Uri.parse(
        request.endpoint.replaceAll('[customer]', ''),
      );
    } else {
      uri = Uri.parse(currentEnvironment.host + request.endpoint);
    }
    if (_getStaticAuth != 'error') {
      _getStaticAuth.then((value) {
        request.customHeaders = {
          'Authorization': value,
          'Content-Type': 'application/json',
        };
      });
    }
    final headers = buildHeaders(request.customHeaders);
    CrayonPaymentLogger.logDebug<NetworkClient>(
      'Sending POST request to the server for url: ${uri.toString()}',
    );
    final response =
        await httpClient.put(uri, headers: headers, body: request.jsonBody);
    print(response.body);
    if (response.statusCode != 200) {
      var res = json.decode(response.body);
      if (res['message'] != null) {
        throw res['message'];
      } else {
        throw 'Something went wrong';
      }
    }
    return NetworkStandardResponse(
      response.body,
      response.statusCode,
      response.headers,
    );
  }

  @override
  Future<NetworkGraphQLResponse> graphQLRequest(GraphQLRequest request) async {
    final graphQLClient = _clientForRequest(request.name);
    if (graphQLClient is MockNetworkClient) {
      return graphQLClient.graphQLRequest(request);
    }
    final client = graphQLClient as GraphQLClient;
    return await _executeGraphQl(request, client);
  }

  Future<NetworkGraphQLResponse> _executeGraphQl(
    GraphQLRequest graphQLRequest,
    GraphQLClient client,
  ) async {
    final mutateOptions = MutationOptions(
      document: gql(graphQLRequest.request),
      variables: graphQLRequest.variables ?? {},
      context: (graphQLRequest.additionalHeaders != null)
          ? _addAdditionalHeaders(graphQLRequest.additionalHeaders!)
          : null,
    );
    CrayonPaymentLogger.logInfo(
      '\n\nNetwork request: ${graphQLRequest.name}, ${graphQLRequest.request}, '
      'variables -- ${graphQLRequest.variables.toString()}'
      '\n\n',
    );
    final result = await client.mutate(mutateOptions);
    CrayonPaymentLogger.logInfo(
      '\n\nNetwork Response: ${graphQLRequest.name}, '
      'variables -- ${graphQLRequest.variables.toString()} --- '
      'data: ${result.data}'
      '\n\n',
    );

    if (!result.hasException) {
      return NetworkGraphQLResponse(data: result.data!);
    } else {
      return _returnWithExceptionMessage(result);
    }
  }

  NetworkGraphQLResponse _returnWithExceptionMessage(QueryResult result) {
    var message = '';
    dynamic exception;
    if (result.exception!.graphqlErrors.isNotEmpty &&
        result.exception!.graphqlErrors.first.extensions != null) {
      exception = result.exception;
      message = result.exception!.graphqlErrors.first.message;
    } else if (result.exception!.linkException != null &&
        result.exception!.linkException!.originalException != null) {
      final originalException = result
          .exception!.linkException!.originalException as FormatException?;
      exception = originalException;
      message = originalException?.message ?? '';
    }
    CrayonPaymentLogger.logError(message);
    return NetworkGraphQLResponse(
      data: (result.data != null) ? result.data! : <String, dynamic>{},
      exception: exception,
      message: message,
    );
  }

  dynamic _clientForRequest(String? name) {
    final gqlName = config.gqlMappingOverrides[name] ??
        _Constants.graphQLDefaultEndpointName;
    return _graphQLClients[gqlName];
  }

  Context _addAdditionalHeaders(Map<String, String> additionalHeaders) {
    final linkHeaders = HttpLinkHeaders(headers: additionalHeaders);
    return Context.fromMap({HttpLinkHeaders: linkHeaders});
  }

  NetworkStandardResponse _internalServerMessage() {
    return NetworkStandardResponse(
      '{"status":false,"code":"Server Error","message":"Internal Server Error","data":{"status":"error","data":null}}',
      500,
      {},
    );
  }

  NetworkStandardResponse _internal404ServerMessage(String message) {
    return NetworkStandardResponse(
      '{"status":false,"code":"Server Error","message":${message},"data":{"status":"error","data":null}}',
      500,
      {},
    );
  }

  Future<NetworkStandardResponse> _logoutUser() async {
    await AppUtils.appUtilsInstance.logoutUser(UserType.Agent);
    return NetworkStandardResponse(
      '{"status":false,"code":"Logout","message":"Logout User","data":{"status":"error","data":null}}',
      401,
      {},
    );
  }
}
