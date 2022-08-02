// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      customerId: json['customerId'] as int?,
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      nidaNo: json['nidaNo'] as String?,
      address: json['address'],
      mobileNo: json['mobileNo'] as String?,
      birthdate: json['birthdate'],
      gender: json['gender'],
      profession: json['profession'],
      emailId: json['emailId'],
      poBoxNumber: json['poBoxNumber'],
      region: json['region'],
      district: json['district'],
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
