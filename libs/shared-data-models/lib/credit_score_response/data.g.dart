// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bandId: json['bandId'] as int?,
      creditLimit: (json['creditLimit'] as num?)?.toDouble(),
      creditScore: json['creditScore'] as int?,
      eligibility: json['eligibility'] as String?,
      remark: json['remark'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bandId': instance.bandId,
      'creditLimit': instance.creditLimit,
      'creditScore': instance.creditScore,
      'eligibility': instance.eligibility,
      'remark': instance.remark,
      'status': instance.status,
    };
