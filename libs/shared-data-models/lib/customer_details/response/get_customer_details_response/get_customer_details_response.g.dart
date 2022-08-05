// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerDetailsResponse _$GetCustomerDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomerDetailsResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerDetailsResponseToJson(
        GetCustomerDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
