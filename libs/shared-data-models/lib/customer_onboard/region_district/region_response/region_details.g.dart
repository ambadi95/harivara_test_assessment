// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionDetails _$RegionDetailsFromJson(Map<String, dynamic> json) =>
    RegionDetails(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionDetailsToJson(RegionDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
