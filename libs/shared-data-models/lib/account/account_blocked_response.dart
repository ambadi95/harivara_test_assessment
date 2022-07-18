class AccountBlockedResponse {
  final String? message;
  final String? reasonCode;
  final String? status;
  final int? statusCode;

  const AccountBlockedResponse(
    this.message,
    this.reasonCode,
    this.status,
    this.statusCode,
  );

  factory AccountBlockedResponse.fromJson(Map<String, dynamic> json) =>
      AccountBlockedResponse(
        json['message'] as String?,
        json['reasonCode'] as String?,
        json['status'] as String?,
        json['statusCode'] as int?,
      );
}
