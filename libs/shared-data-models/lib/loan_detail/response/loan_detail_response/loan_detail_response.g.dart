// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanDetailResponse _$LoanDetailResponseFromJson(Map<String, dynamic> json) =>
    LoanDetailResponse(
      code: json['code'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$LoanDetailResponseToJson(LoanDetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
