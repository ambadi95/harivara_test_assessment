// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasscodeRequest _$PasscodeRequestFromJson(Map<String, dynamic> json) =>
    PasscodeRequest(
      id: json['id'] as int?,
      type: json['type'] as String?,
      passcode: json['passcode'] as String?,
    );

Map<String, dynamic> _$PasscodeRequestToJson(PasscodeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'passcode': instance.passcode,
    };
