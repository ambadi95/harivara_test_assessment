// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailResponse _$CustomerDetailResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDetailResponseToJson(
        CustomerDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
