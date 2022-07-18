import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/global_control/model/configuration/config.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/graphql/network_graphql_response.dart';
import 'package:network_manager/model/response/network_standard_response.dart';

/// How to use MockNetworkClient?
/// 1. Create `network-mocks` directory under `assets` in your package
/// 2. Register asset in your package pubspec.yaml
/// ```
///     flutter:
///       assets:
///         - assets/network-mocks/
/// ```
/// 3. For each response you want to mock add json file named after GraphQL request name (same you use in [GraphQLRequest.name])
///
//todo implement switching mock with configuration, not hardcoding MockNetworkClient in DI
//todo implement mock different responses for the same request
//todo implement developer tool to queue different responses for same request. F.E. error -> success -> different error
class MockNetworkClient extends INetworkClient {
  @override
  Future<NetworkGraphQLResponse> graphQLRequest(GraphQLRequest request) async {
    final codeToJsonResponse = await _findResponsesFor(request.name);
    if (codeToJsonResponse.isEmpty) {
      throw _missingResponseMessage(request);
    } else if (codeToJsonResponse.length == 1) {
      return _retrieveResult(
        request,
        codeToJsonResponse.values.first as Map<String, dynamic>,
      );
    } else {
      //todo load result by configuration
      final resultByConfig = codeToJsonResponse['200'];
      print(resultByConfig);
      return _retrieveResult(request, resultByConfig as Map<String, dynamic>);
    }
  }

  String _missingResponseMessage(GraphQLRequest request) => '''

Response mock for "${request.name}.json" is missing. Please make sure you have done the following:

  1. Created the file "${request.name}.json" under "assets/network-mocks" directory in your module
  2. Registered "assets/network-mocks" in your module pubspec.yaml.
  3. Deleted build directory and restarted the application

''';

  @override
  void initializeGraphQlClient({
    required Config config,
    required String accessToken,
    required Map<String, String> headers,
  }) {}

  @override
  Future<NetworkStandardResponse> standardRequest(StandardRequest request) {
    print('standardRequest');
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> _loadJsonMap(String filePath) async {
    final contents = await rootBundle.loadString(filePath);
    final result = json.decode(contents) as Map<String, dynamic>;
    return result;
  }

  NetworkGraphQLResponse _retrieveResult(
    GraphQLRequest request,
    Map<String, dynamic> jsonResult,
  ) {
    final result = QueryResult.internal(
      data: jsonResult['data'] as Map<String, dynamic>,
      source: QueryResultSource.network,
      parserFn: (data) {},
    );
    return NetworkGraphQLResponse(
      data: (result.data != null) ? result.data! : <String, dynamic>{},
      exception: result.exception,
    );
  }

  Future<Map<String, dynamic>> _findResponsesFor(String? name) async {
    if (name != null) {
      final assetManifestJson = await _loadJsonMap('AssetManifest.json');
      final networkMocksKeys = assetManifestJson.keys
          .where((element) => element.contains('network-mocks'));

      for (final key in networkMocksKeys) {
        try {
          final jsonResponse = await _loadJsonMap(key);
          final filename = key.split('/').last.split('.').first;
          if (filename == name) {
            return jsonResponse;
          }
        } catch (error) {
          CrayonPaymentLogger.logWarning('Building headers for request');
          print('[WARNING] $key has incorrect name, should be name.json');
        }
      }
    }
    return {};
  }
}
