class UpdateMobileNumberRequest {
  final String? customerId;
  final String? mobileNo;

  const UpdateMobileNumberRequest({this.customerId, this.mobileNo});

  factory UpdateMobileNumberRequest.fromJson(Map<String, dynamic> json) =>
      UpdateMobileNumberRequest(
        customerId: json['customerId'] as String?,
        mobileNo: json['mobileNo'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'customerId': customerId,
        'mobileNo': mobileNo,
      };
}
