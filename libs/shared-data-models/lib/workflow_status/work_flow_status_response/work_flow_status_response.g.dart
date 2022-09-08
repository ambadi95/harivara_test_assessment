// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_flow_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkFlowStatusResponse _$WorkFlowStatusResponseFromJson(
        Map<String, dynamic> json) =>
    WorkFlowStatusResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkFlowStatusResponseToJson(
        WorkFlowStatusResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
