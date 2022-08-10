// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      y9AgentId: json['y9AgentId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'],
      nidaNo: json['nidaNo'] as String?,
      mobileNo: json['mobileNo'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      emailId: json['emailId'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'y9AgentId': instance.y9AgentId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'nidaNo': instance.nidaNo,
      'mobileNo': instance.mobileNo,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'emailId': instance.emailId,
      'address': instance.address,
    };
