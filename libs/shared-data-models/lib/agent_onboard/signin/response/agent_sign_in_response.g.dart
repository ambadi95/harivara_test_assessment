// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentSignInResponse _$AgentSignInResponseFromJson(Map<String, dynamic> json) =>
    AgentSignInResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgentSignInResponseToJson(
        AgentSignInResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
