// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mno_consent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MnoConsentResponse _$MnoConsentResponseFromJson(Map<String, dynamic> json) =>
    MnoConsentResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MnoConsentResponseToJson(MnoConsentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
