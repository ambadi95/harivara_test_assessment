class EmailVerificationResponse {
  final String? merchantApplicationId;
  final String? message;
  final String? status;

  final int? statusCode;
  final String? verifyLink;

  const EmailVerificationResponse(
    this.merchantApplicationId,
    this.message,
    this.status,
    this.statusCode,
    this.verifyLink,
  );

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      EmailVerificationResponse(
        json['id'],
        json['message'],
        json['status'],
        json['statusCode'],
        json['verifyLink'],
      );
}
