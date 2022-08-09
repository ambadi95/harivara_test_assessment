import 'dart:convert';

import 'package:network_manager/model/status/http_status.dart';
import 'package:http/http.dart';

/// This is a standard network response that should be used for all standard
/// restful responses.
class NetworkStandardResponse extends Response {
  NetworkStandardResponse(
    String body,
    int statusCode,
    Map<String, String> headers,
  ) : super(body, statusCode, headers: headers);

  /// Produces a map of decoded JSON
  Map<String, dynamic>? get jsonResult =>
      jsonDecode(body) as Map<String, dynamic>;

  bool get isSuccess =>
      statusCode == HttpStatus.ok || statusCode == HttpStatus.created;
  bool get isNotConnected => statusCode == HttpStatus.noConnectionToInternet;
}
