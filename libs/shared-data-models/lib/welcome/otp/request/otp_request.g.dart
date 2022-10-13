// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequest _$OtpRequestFromJson(Map<String, dynamic> json) => OtpRequest(
      id: json['id'] as String?,
      type: json['type'] as String?,
      event: json['event'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$OtpRequestToJson(OtpRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'event': instance.event,
      'mobile': instance.mobile,
    };
