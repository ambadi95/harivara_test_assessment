// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      paymentId: json['paymentId'] as String?,
      status: json['status'] as String?,
      amountPaid: json['amountPaid'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'paymentId': instance.paymentId,
      'status': instance.status,
      'amountPaid': instance.amountPaid,
    };
