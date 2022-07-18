class UpdateMobileNumberResponse {
  final int? statusCode;
  final String? status;
  final String? message;
  final String? reasonCode;

  const UpdateMobileNumberResponse({
    this.statusCode,
    this.status,
    this.message,
    this.reasonCode,
  });

  factory UpdateMobileNumberResponse.fromJson(Map<String, dynamic> json) =>
      UpdateMobileNumberResponse(
        statusCode: json['statusCode'] as int?,
        status: json['status'] as String?,
        message: json['message'] as String?,
        reasonCode: json['reasonCode'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'statusCode': statusCode,
        'status': status,
        'message': message,
        'reasonCode': reasonCode,
      };
}
