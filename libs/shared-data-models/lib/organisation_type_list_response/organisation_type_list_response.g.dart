// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganisationTypeListResponse _$OrganisationTypeListResponseFromJson(
        Map<String, dynamic> json) =>
    OrganisationTypeListResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OrganisationTypeListResponseToJson(
        OrganisationTypeListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
