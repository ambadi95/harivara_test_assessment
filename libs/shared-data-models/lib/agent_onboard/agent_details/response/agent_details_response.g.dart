// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentDetailsResponse _$AgentDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AgentDetailsResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgentDetailsResponseToJson(
        AgentDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
