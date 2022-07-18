class MerchantModel {
  final String? merchantId;
  final String? mobileNo;
  final String? email;
  final String? companyName;
  final String? registrationNo;

  const MerchantModel({
    this.merchantId,
    this.mobileNo,
    this.email,
    this.companyName,
    this.registrationNo,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) => MerchantModel(
        merchantId: json['merchantId'],
        mobileNo: json['mobileNo'],
        email: json['email'],
        companyName: json['companyName'],
        registrationNo: json['registrationNo'],
      );
}
