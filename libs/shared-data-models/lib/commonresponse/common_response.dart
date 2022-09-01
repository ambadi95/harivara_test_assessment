import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'common_data.dart';

class CommonResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const CommonResponse({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory CommonResponse.fromMap(Map<String, dynamic> data) {
    return CommonResponse(
      code: data['code'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromJson(data['data'] as Map<String, dynamic>),
      message: data['message'] as String?,
      status: data['status'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
    'code': code,
    'data': data?.toJson(),
    'message': message,
    'status': status,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommonResponse].
  factory CommonResponse.fromJson(String data) {
    return CommonResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommonResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CommonResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return CommonResponse(
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
