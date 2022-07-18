/// Base request for all subsequent requests.
///
/// Holds generic information for all requests.
abstract class Request {
  /// The endpoint on the server you will be connecting to
  late String endpoint;

  /// The type of restful request you are making.
  late RequestType requestType;

  /// The headers that are custom to the request
  Map<String, String>? customHeaders;
}

enum RequestType {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}
