import 'package:network_manager/global_control/model/configuration/config.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/graphql/network_graphql_response.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import '../model/requests/graph_ql/graphql_get_request.dart';

abstract class INetworkClient {
  /// Makes a Standard Request to an external API.
  ///
  /// [request] is generically typed to accept any type of request that belongs
  /// to the standard group of requests.
  Future<NetworkStandardResponse> standardRequest(StandardRequest request);

  /// Makes a GET Request using GraphQL to an external API.
  ///
  /// [request] contains the information necessary for the method to make a
  /// GET Request to the API.
  /// todo: complete generic implementation of graphql requests
  Future<NetworkGraphQLResponse> graphQLRequest(GraphQLRequest request);

  void initializeGraphQlClient({
    required Config config,
    required String accessToken,
    required Map<String, String> headers,
  });
}
