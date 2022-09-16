// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditScoreResponse _$CreditScoreResponseFromJson(Map<String, dynamic> json) =>
    CreditScoreResponse(
      code: json['code'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$CreditScoreResponseToJson(
        CreditScoreResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
