// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      customerId: json['customerId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'],
      nidaNo: json['nidaNo'] as String?,
      address: json['address'] as String?,
      mobileNo: json['mobileNo'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      profession: json['profession'],
      emailId: json['emailId'] as String?,
      poBoxNumber: json['poBoxNumber'] as String?,
      region: json['region'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'nidaNo': instance.nidaNo,
      'address': instance.address,
      'mobileNo': instance.mobileNo,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'profession': instance.profession,
      'emailId': instance.emailId,
      'poBoxNumber': instance.poBoxNumber,
      'region': instance.region,
      'district': instance.district,
    };
