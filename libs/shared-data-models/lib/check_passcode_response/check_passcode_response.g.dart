// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_passcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPasscodeResponse _$CheckPasscodeResponseFromJson(
        Map<String, dynamic> json) =>
    CheckPasscodeResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckPasscodeResponseToJson(
        CheckPasscodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
