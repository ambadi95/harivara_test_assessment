import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? bandId;
  final double? creditLimit;
  final int? creditScore;
  final String? eligibility;
  final String? remark;
  final String? status;

  const Data({
    this.bandId,
    this.creditLimit,
    this.creditScore,
    this.eligibility,
    this.remark,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? bandId,
    double? creditLimit,
    int? creditScore,
    String? eligibility,
    String? remark,
    String? status,
  }) {
    return Data(
      bandId: bandId ?? this.bandId,
      creditLimit: creditLimit ?? this.creditLimit,
      creditScore: creditScore ?? this.creditScore,
      eligibility: eligibility ?? this.eligibility,
      remark: remark ?? this.remark,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      bandId,
      creditLimit,
      creditScore,
      eligibility,
      remark,
      status,
    ];
  }
}
