// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasscodeResponse _$PasscodeResponseFromJson(Map<String, dynamic> json) =>
    PasscodeResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] as int?,
    );

Map<String, dynamic> _$PasscodeResponseToJson(PasscodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
