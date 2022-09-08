import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'payment_status_check_response.g.dart';

@JsonSerializable()
class PaymentStatusCheckResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const PaymentStatusCheckResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory PaymentStatusCheckResponse.fromJson(Map<String, dynamic> json) {
    return _$PaymentStatusCheckResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentStatusCheckResponseToJson(this);

  PaymentStatusCheckResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return PaymentStatusCheckResponse(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, message, data];
}
