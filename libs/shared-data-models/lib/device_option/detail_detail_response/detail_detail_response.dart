import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class DetailDetailResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const DetailDetailResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory DetailDetailResponse.fromMap(Map<String, dynamic> data) {
    return DetailDetailResponse(
      status: data['status'] as bool?,
      code: data['code'] as String?,
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailDetailResponse].
  factory DetailDetailResponse.fromJson(String data) {
    return DetailDetailResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailDetailResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  DetailDetailResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return DetailDetailResponse(
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
