// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_customer_onboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCustomerOnboardResponse _$AgentCustomerOnboardResponseFromJson(
        Map<String, dynamic> json) =>
    AgentCustomerOnboardResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgentCustomerOnboardResponseToJson(
        AgentCustomerOnboardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
