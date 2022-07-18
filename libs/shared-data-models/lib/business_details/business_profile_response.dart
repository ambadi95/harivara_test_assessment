import 'package:equatable/equatable.dart';

class BusinessProfile extends Equatable {
  final String merchantId;
  final String mobileNo;
  final String email;
  final String companyName;
  final String registrationNo;
  final String companyType;
  final List<dynamic> management;
  final String registrationExpiry;
  final dynamic trValue;
  final dynamic trVolume;
  final String applicationId;
  final bool emailVerified;
  final bool status;
  final String picByte;
  final String address;
  final dynamic businessCategory;

  const BusinessProfile(
    this.merchantId,
    this.mobileNo,
    this.email,
    this.companyName,
    this.management,
    this.companyType,
    this.address,
    this.registrationNo,
    this.registrationExpiry,
    this.trVolume,
    this.trValue,
    this.emailVerified,
    this.status,
    this.picByte,
    this.businessCategory,
    this.applicationId,
  );

  factory BusinessProfile.fromJson(Map<String, dynamic> json) =>
      BusinessProfile(
        json['merchantId'] ?? '',
        json['mobileNo'] ?? '',
        json['email'] ?? '',
        json['companyName'] ?? '',
        json['management'] ?? [],
        json['companyType'] ?? '',
        json['address'] ?? '',
        json['registrationNo'] ?? '',
        json['registrationExpiry'] ?? '',
        json['trVolume'] ?? {'key': '', 'value': ''},
        json['trValue'] ?? {'key': '', 'value': ''},
        json['emailVerified'] ?? false,
        json['status'] ?? false,
        json['picByte'] ?? '',
        json['businessCategory'] ?? {'key': '', 'value': ''},
        json['applicationId'] ?? '',
      );

  @override
  List<Object?> get props => [
    merchantId,
    mobileNo,
    email,
    companyName,
    registrationNo,
    companyType,
    management,
    registrationExpiry,
    trValue,
    trVolume,
    applicationId,
    address,
    management,
    emailVerified,
    status,
    picByte,
    businessCategory,
    applicationId
  ];
}
