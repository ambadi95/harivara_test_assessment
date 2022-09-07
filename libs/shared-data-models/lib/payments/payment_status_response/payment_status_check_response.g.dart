// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_check_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentStatusCheckResponse _$PaymentStatusCheckResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentStatusCheckResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentStatusCheckResponseToJson(
        PaymentStatusCheckResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
