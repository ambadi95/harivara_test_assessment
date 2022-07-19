import 'package:shared_data_models/agent/file_model.dart';

class SubmitMerchantApplicationRequest {
  final BusinessDetails? businessDetails;
  final CompanyDetails? companyDetails;
  final String? email;
  final ManagementInfo? managementInfo;
  final String? mobileNo;

  const SubmitMerchantApplicationRequest({
    this.businessDetails,
    this.companyDetails,
    this.email,
    this.managementInfo,
    this.mobileNo,
  });

  factory SubmitMerchantApplicationRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      SubmitMerchantApplicationRequest(
        businessDetails: json['businessDetails'],
        companyDetails: json['companyDetails'],
        email: json['email'],
        managementInfo: json['managementInfo'],
        mobileNo: json['mobileNo'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'businessDetails': businessDetails,
        'companyDetails': companyDetails,
        'email': email,
        'managementInfo': managementInfo,
        'mobileNo': mobileNo,
      };
}

class CreateMerchantRequest {
  final String? applicationId;
  final BusinessDetails? businessDetails;
  final CompanyDetails? companyDetails;
  final ManagementInfo? managementInfo;
  final String? mobileNo;
  final String? email;
  final List<FileModel>? file;

  const CreateMerchantRequest({
    this.applicationId,
    this.mobileNo,
    this.email,
    this.companyDetails,
    this.managementInfo,
    this.businessDetails,
    this.file,
  });

  factory CreateMerchantRequest.fromJson(Map<String, dynamic> json) =>
      CreateMerchantRequest(
        applicationId: json['applicationId'],
        mobileNo: json['mobileNo'],
        email: json['email'],
        companyDetails: json['companyDetails'],
        managementInfo: json['managementInfo'],
        businessDetails: json['businessDetails'],
        file: json['file'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'applicationId': applicationId,
        'mobileNo': mobileNo,
        'email': email,
        'companyDetails': companyDetails,
        'businessDetails': businessDetails,
        'managementInfo': managementInfo,
        'file': file,
      };
}

class CompanyDetails {
  final String? companyName;
  final String? registrationNo;
  final String? companyType;
  final String? registrationDocUrl;

  const CompanyDetails({
    this.companyName,
    this.registrationNo,
    this.companyType,
    this.registrationDocUrl,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) => CompanyDetails(
        companyName: json['companyName'],
        registrationNo: json['registrationNo'],
        companyType: json['companyType'],
        registrationDocUrl: json['registrationDocUrl'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'companyName': companyName,
        'registrationNo': registrationNo,
        'companyType': companyType,
        'registrationDocUrl': registrationDocUrl
      };
}

class BusinessDetails {
  final BusinessCategory? businessCategory;
  final TransactionValue? transactionValue;
  final TransactionVolume? transactionVolume;

  const BusinessDetails({
    this.businessCategory,
    this.transactionValue,
    this.transactionVolume,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) =>
      BusinessDetails(
        businessCategory: json['businessCategory'],
        transactionValue: json['transactionValue'],
        transactionVolume: json['transactionVolume'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'businessCategory': businessCategory,
        'transactionVolume': transactionVolume,
        'transactionValue': transactionValue,
      };
}

class NatureOfBusiness {
  final String? key;
  final String? value;

  const NatureOfBusiness({
    this.key,
    this.value,
  });

  factory NatureOfBusiness.fromJson(Map<String, dynamic> json) =>
      NatureOfBusiness(
        key: json['key'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'value': value,
      };
}

class BusinessCategory {
  final String? key;
  final String? value;

  const BusinessCategory({
    this.key,
    this.value,
  });

  factory BusinessCategory.fromJson(Map<String, dynamic> json) =>
      BusinessCategory(
        key: json['key'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'value': value,
      };
}

class TransactionVolume {
  final String? key;
  final String? value;

  const TransactionVolume({
    this.key,
    this.value,
  });

  factory TransactionVolume.fromJson(Map<String, dynamic> json) =>
      TransactionVolume(
        key: json['key'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'value': value,
      };
}

class TransactionValue {
  final String? key;
  final String? value;

  const TransactionValue({
    this.key,
    this.value,
  });

  factory TransactionValue.fromJson(Map<String, dynamic> json) =>
      TransactionValue(
        key: json['key'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'value': value,
      };
}

class ManagementInfo {
  final String? boDocUrl;
  final List<String>? srManagement;
  final List<String>? srMgmtDocsUrls;

  const ManagementInfo({
    this.boDocUrl,
    this.srManagement,
    this.srMgmtDocsUrls,
  });

  factory ManagementInfo.fromJson(Map<String, dynamic> json) => ManagementInfo(
        boDocUrl: json['boDocUrl'],
        srManagement: json['srManagement'],
        srMgmtDocsUrls: json['srMgmtDocsUrls'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'boDocUrl': boDocUrl,
        'srManagement': srManagement,
        'srMgmtDocsUrls': srMgmtDocsUrls,
      };
}
