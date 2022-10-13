import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'customer_detail_response.g.dart';

@JsonSerializable()
class CustomerDetailResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? y9ErrorCode;
  final String? message;
  final Data? data;

  const CustomerDetailResponse({
    this.status,
    this.code,
    this.y9ErrorCode,
    this.message,
    this.data,
  });

  factory CustomerDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerDetailResponseToJson(this);

  CustomerDetailResponse copyWith({
    bool? status,
    String? code,
    String? y9ErrorCode,
    String? message,
    Data? data,
  }) {
    return CustomerDetailResponse(
      status: status ?? this.status,
      code: code ?? this.code,
      y9ErrorCode: y9ErrorCode ?? this.y9ErrorCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code,y9ErrorCode, message, data];
}
