// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailsRequest _$CustomerDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailsRequest(
      customerId: json['customerId'] as int?,
      nidaNo: json['nidaNo'] as String?,
      mobileNo: json['mobileNo'] as String?,
      address: json['address'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      profession: json['profession'] as String?,
      emailId: json['emailId'] as String?,
      poBoxNumber: json['poBoxNumber'] as String?,
      region: json['region'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsRequestToJson(
        CustomerDetailsRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'nidaNo': instance.nidaNo,
      'mobileNo': instance.mobileNo,
      'address': instance.address,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'profession': instance.profession,
      'emailId': instance.emailId,
      'poBoxNumber': instance.poBoxNumber,
      'region': instance.region,
      'district': instance.district,
    };
