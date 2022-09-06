// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerificationRequest _$OtpVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    OtpVerificationRequest(
      id: json['id'] as String?,
      type: json['type'] as String?,
      otp: json['otp'] as String?,
      event:json['event'] as String?
    );

Map<String, dynamic> _$OtpVerificationRequestToJson(
        OtpVerificationRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'otp': instance.otp,
      'event':instance.event
    };
