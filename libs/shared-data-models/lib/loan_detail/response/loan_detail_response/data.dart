import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? dailyRepaymentAmount;
  final String? deviceInsurance;
  final String? deviceInsuranceId;
  final String? finalPaymentDate;
  final String? joiningFee;
  final String? loanAmount;
  final String? loanId;
  final String? loanStartDate;
  final String? loanTenure;
  final String? outStandingAmount;
  final String? repaymentFee;
  final String? repaymentType;
  final String? totalAmountToBeRepaid;

  const Data({
    this.dailyRepaymentAmount,
    this.deviceInsurance,
    this.deviceInsuranceId,
    this.finalPaymentDate,
    this.joiningFee,
    this.loanAmount,
    this.loanId,
    this.loanStartDate,
    this.loanTenure,
    this.outStandingAmount,
    this.repaymentFee,
    this.repaymentType,
    this.totalAmountToBeRepaid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? dailyRepaymentAmount,
    String? deviceInsurance,
    String? deviceInsuranceId,
    String? finalPaymentDate,
    String? joiningFee,
    String? loanAmount,
    String? loanId,
    String? loanStartDate,
    String? loanTenure,
    String? outStandingAmount,
    String? repaymentFee,
    String? repaymentType,
    String? totalAmountToBeRepaid,
  }) {
    return Data(
      dailyRepaymentAmount: dailyRepaymentAmount ?? this.dailyRepaymentAmount,
      deviceInsurance: deviceInsurance ?? this.deviceInsurance,
      deviceInsuranceId: deviceInsuranceId ?? this.deviceInsuranceId,
      finalPaymentDate: finalPaymentDate ?? this.finalPaymentDate,
      joiningFee: joiningFee ?? this.joiningFee,
      loanAmount: loanAmount ?? this.loanAmount,
      loanId: loanId ?? this.loanId,
      loanStartDate: loanStartDate ?? this.loanStartDate,
      loanTenure: loanTenure ?? this.loanTenure,
      outStandingAmount: outStandingAmount ?? this.outStandingAmount,
      repaymentFee: repaymentFee ?? this.repaymentFee,
      repaymentType: repaymentType ?? this.repaymentType,
      totalAmountToBeRepaid:
          totalAmountToBeRepaid ?? this.totalAmountToBeRepaid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      dailyRepaymentAmount,
      deviceInsurance,
      deviceInsuranceId,
      finalPaymentDate,
      joiningFee,
      loanAmount,
      loanId,
      loanStartDate,
      loanTenure,
      outStandingAmount,
      repaymentFee,
      repaymentType,
      totalAmountToBeRepaid,
    ];
  }
}
