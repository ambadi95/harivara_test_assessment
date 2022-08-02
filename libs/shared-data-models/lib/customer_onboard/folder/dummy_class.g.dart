// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyClass _$DummyClassFromJson(Map<String, dynamic> json) => DummyClass(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DummyClassToJson(DummyClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
