import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'credit_score_response.g.dart';

@JsonSerializable()
class CreditScoreResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const CreditScoreResponse({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory CreditScoreResponse.fromJson(Map<String, dynamic> json) {
    return _$CreditScoreResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreditScoreResponseToJson(this);

  CreditScoreResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return CreditScoreResponse(
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
