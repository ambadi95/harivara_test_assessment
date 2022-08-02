// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentSignUpResponse _$AgentSignUpResponseFromJson(Map<String, dynamic> json) =>
    AgentSignUpResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgentSignUpResponseToJson(
        AgentSignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
