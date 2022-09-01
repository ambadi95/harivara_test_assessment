import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? dailyRepaymentAmount;
  final int? deviceId;
  final String? finalPaymentDate;
  final int? joiningFee;
  final String? totalAmountToBeRepaid;

  const Data({
    this.dailyRepaymentAmount,
    this.deviceId,
    this.finalPaymentDate,
    this.joiningFee,
    this.totalAmountToBeRepaid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? dailyRepaymentAmount,
    int? deviceId,
    String? finalPaymentDate,
    int? joiningFee,
    String? totalAmountToBeRepaid,
  }) {
    return Data(
      dailyRepaymentAmount: dailyRepaymentAmount ?? this.dailyRepaymentAmount,
      deviceId: deviceId ?? this.deviceId,
      finalPaymentDate: finalPaymentDate ?? this.finalPaymentDate,
      joiningFee: joiningFee ?? this.joiningFee,
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
      deviceId,
      finalPaymentDate,
      joiningFee,
      totalAmountToBeRepaid,
    ];
  }
}
