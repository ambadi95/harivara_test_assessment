class NetworkGraphQLResponse {
  NetworkGraphQLResponse({
    this.data,
    this.exception,
    this.message,
    this.errorCode,
  });

  final Map<String, dynamic>? data;
  final dynamic exception;
  final String? message;
  final String? errorCode;

  bool get hasException => exception != null;

  bool get isSuccess => !hasException;

  bool get isNotSuccess => !isSuccess;

  NetworkGraphQLResponse copyWith({
    Map<String, dynamic>? data,
    dynamic exception,
    String? message,
    String? errorCode,
  }) =>
      NetworkGraphQLResponse(
        data: data ?? this.data,
        exception: exception ?? this.exception,
        message: message ?? this.message,
        errorCode: errorCode ?? this.errorCode,
      );
}
