import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class CreateLoanResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const CreateLoanResponse({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory CreateLoanResponse.fromMap(Map<String, dynamic> data) {
    return CreateLoanResponse(
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
  /// Parses the string and returns the resulting Json object as [CreateLoanResponse].
  factory CreateLoanResponse.fromJson(String data) {
    return CreateLoanResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateLoanResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateLoanResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return CreateLoanResponse(
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
