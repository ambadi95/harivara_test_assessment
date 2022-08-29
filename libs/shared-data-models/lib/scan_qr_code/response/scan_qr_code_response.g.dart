// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_qr_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanQRCodeResponse _$ScanQRCodeResponseFromJson(Map<String, dynamic> json) =>
    ScanQRCodeResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScanQRCodeResponseToJson(ScanQRCodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
