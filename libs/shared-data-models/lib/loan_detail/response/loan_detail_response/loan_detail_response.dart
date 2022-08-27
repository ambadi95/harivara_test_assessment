import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'loan_detail_response.g.dart';

@JsonSerializable()
class LoanDetailResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const LoanDetailResponse({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory LoanDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$LoanDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoanDetailResponseToJson(this);

  LoanDetailResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return LoanDetailResponse(
      code: code ?? this.code,
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, data, message, status];
}
