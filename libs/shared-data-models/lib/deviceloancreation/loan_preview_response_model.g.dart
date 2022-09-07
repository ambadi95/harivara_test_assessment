// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_preview_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanPreviewResponseModel _$LoanPreviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    LoanPreviewResponseModel(
      code: json['code'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$LoanPreviewResponseModelToJson(
        LoanPreviewResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
