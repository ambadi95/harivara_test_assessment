// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_condition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermConditionResponse _$TermConditionResponseFromJson(
        Map<String, dynamic> json) =>
    TermConditionResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermConditionResponseToJson(
        TermConditionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
