class EmailRegistrationResponse {
  final int? statusCode;
  final String? status;
  final String? message;
  final String? verifyLink;
  final String? merchantApplicationId;

  const EmailRegistrationResponse(
      this.statusCode,
      this.status,
      this.message,
      this.verifyLink,
      this.merchantApplicationId,
      );

  factory EmailRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      EmailRegistrationResponse(
        json['statusCode'],
        json['status'],
        json['message'],
        json['verifyLink'],
        json['id'],
      );
}
