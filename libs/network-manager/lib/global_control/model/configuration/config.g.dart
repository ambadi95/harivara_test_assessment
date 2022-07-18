// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      (json['environments'] as List<dynamic>)
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gqlEnvironments'] as List<dynamic>)
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      Map<String, String>.from(json['gqlMappingOverrides'] as Map),
      Map<String, String>.from(json['headers'] as Map),
      json['useMockNetworkClient'] as bool?,
      json['certificateType'] as String,
      json['otpServiceCode'] as String?,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'certificateType': instance.certificateType,
      'environments': instance.environments,
      'gqlEnvironments': instance.gqlEnvironments,
      'gqlMappingOverrides': instance.gqlMappingOverrides,
      'headers': instance.headers,
      'useMockNetworkClient': instance.useMockNetworkClient,
      'otpServiceCode': instance.otpServiceCode,
    };

Environment _$EnvironmentFromJson(Map<String, dynamic> json) => Environment(
      json['name'] as String,
      json['host'] as String,
      (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'host': instance.host,
      'headers': instance.headers,
    };
