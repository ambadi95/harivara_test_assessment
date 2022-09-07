// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dailyRepaymentAmount: json['dailyRepaymentAmount'] as String?,
      deviceInsurance: json['deviceInsurance'] as String?,
      deviceInsuranceId: json['deviceInsuranceId'] as String?,
      finalPaymentDate: json['finalPaymentDate'] as String?,
      joiningFee: json['joiningFee'] as String?,
      loanAmount: json['loanAmount'] as String?,
      loanId: json['loanId'] as String?,
      loanStartDate: json['loanStartDate'] as String?,
      loanTenure: json['loanTenure'] as String?,
      outStandingAmount: json['outStandingAmount'] as String?,
      repaymentFee: json['repaymentFee'] as String?,
      repaymentType: json['repaymentType'] as String?,
      totalAmountToBeRepaid: json['totalAmountToBeRepaid'] as String?,
      brand: json['brand'] as String?,
      modelNumber: json['modelNumber'] as String?,
      deviceId: json['deviceId'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dailyRepaymentAmount': instance.dailyRepaymentAmount,
      'deviceInsurance': instance.deviceInsurance,
      'deviceInsuranceId': instance.deviceInsuranceId,
      'finalPaymentDate': instance.finalPaymentDate,
      'joiningFee': instance.joiningFee,
      'loanAmount': instance.loanAmount,
      'loanId': instance.loanId,
      'loanStartDate': instance.loanStartDate,
      'loanTenure': instance.loanTenure,
      'outStandingAmount': instance.outStandingAmount,
      'repaymentFee': instance.repaymentFee,
      'repaymentType': instance.repaymentType,
      'totalAmountToBeRepaid': instance.totalAmountToBeRepaid,
      'brand': instance.brand,
      'modelNumber': instance.modelNumber,
      'deviceId': instance.deviceId,
    };
