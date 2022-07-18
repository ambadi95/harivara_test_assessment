class MerchantResponse {
  final String? address;
  final String? applicationId;
  final String? companyName;
  final String? companyType;
  final String? email;
  final bool? emailVerified;
  final List<dynamic>? management;
  final String? merchantId;
  final String? mobileNo;
  final String? picByte;
  final String? registrationExpiry;
  final String? registrationNo;
  final bool? status;
  final dynamic trValue;
  final dynamic trVolume;
  final dynamic businessCategory;

  const MerchantResponse(
    this.address,
    this.applicationId,
    this.companyName,
    this.companyType,
    this.email,
    this.emailVerified,
    this.management,
    this.merchantId,
    this.mobileNo,
    this.picByte,
    this.registrationExpiry,
    this.registrationNo,
    this.status,
    this.trValue,
    this.trVolume,
    this.businessCategory,
  );

  factory MerchantResponse.fromJson(Map<String, dynamic> json) =>
      MerchantResponse(
        json['address'] ?? '',
        json['applicationId'] ?? '',
        json['companyName'] ?? '',
        json['companyType'] ?? '',
        json['email'] ?? '',
        json['emailVerified'] ?? false,
        json['management'],
        json['merchantId'] ?? '',
        json['mobileNo'] ?? '',
        json['picByte'] ?? '',
        json['registrationExpiry'] ?? '',
        json['registrationNo'] ?? '',
        json['status'] ?? false,
        json['trValue']['value'] ?? '',
        json['trVolume']['value'] ?? '',
        json['businessCategory']['value'] ?? '',
      );
}

class MerchantStatusDetails {
  final String registrationNo;
  final String companyType;
  final List<dynamic>? management;
  final String registrationExpiry;
  final String trValue;
  final String trVolume;
  final String applicationId;

  const MerchantStatusDetails(
    this.management,
    this.companyType,
    this.registrationNo,
    this.registrationExpiry,
    this.trVolume,
    this.trValue,
    this.applicationId,
  );
}
