// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_check_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycCheckResponse _$KycCheckResponseFromJson(Map<String, dynamic> json) =>
    KycCheckResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KycCheckResponseToJson(KycCheckResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
