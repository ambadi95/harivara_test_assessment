import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class LoanApprovalResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const LoanApprovalResponse({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory LoanApprovalResponse.fromMap(Map<String, dynamic> data) {
    return LoanApprovalResponse(
      code: data['code'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
      message: data['message'] as String?,
      status: data['status'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'data': data?.toMap(),
        'message': message,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoanApprovalResponse].
  factory LoanApprovalResponse.fromJson(String data) {
    return LoanApprovalResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoanApprovalResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  LoanApprovalResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return LoanApprovalResponse(
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
