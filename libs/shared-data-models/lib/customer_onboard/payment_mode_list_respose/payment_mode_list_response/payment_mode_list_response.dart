import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class PaymentModeListResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<Datum>? data;

  const PaymentModeListResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory PaymentModeListResponse.fromMap(Map<String, dynamic> data) {
    return PaymentModeListResponse(
      status: data['status'] as bool?,
      code: data['code'] as String?,
      message: data['message'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentModeListResponse].
  factory PaymentModeListResponse.fromJson(String data) {
    return PaymentModeListResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentModeListResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  PaymentModeListResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<Datum>? data,
  }) {
    return PaymentModeListResponse(
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
