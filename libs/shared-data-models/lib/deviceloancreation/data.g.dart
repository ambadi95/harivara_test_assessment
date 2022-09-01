// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dailyRepaymentAmount: json['dailyRepaymentAmount'] as int?,
      deviceId: json['deviceId'] as int?,
      finalPaymentDate: json['finalPaymentDate'] as String?,
      joiningFee: json['joiningFee'] as int?,
      totalAmountToBeRepaid: json['totalAmountToBeRepaid'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dailyRepaymentAmount': instance.dailyRepaymentAmount,
      'deviceId': instance.deviceId,
      'finalPaymentDate': instance.finalPaymentDate,
      'joiningFee': instance.joiningFee,
      'totalAmountToBeRepaid': instance.totalAmountToBeRepaid,
    };
