class LoginRequest {
  final String customerId;
  final String passcode;

  const LoginRequest(this.customerId, this.passcode);

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        json['customerId'],
        json['passcode'],
      );

  Map<String, dynamic> toJson(LoginRequest request) {
    return {
      'customerId': request.customerId,
      'passcode': request.passcode,
    };
  }
}
