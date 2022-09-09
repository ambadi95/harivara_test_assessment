import 'dart:convert';

import 'package:equatable/equatable.dart';

class PreferenceResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final dynamic data;

  const PreferenceResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory PreferenceResponse.fromMap(Map<String, dynamic> data) {
    return PreferenceResponse(
      status: data['status'] as bool?,
      code: data['code'] as String?,
      message: data['message'] as String?,
      data: data['data'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PreferenceResponse].
  factory PreferenceResponse.fromJson(String data) {
    return PreferenceResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PreferenceResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  PreferenceResponse copyWith({
    bool? status,
    String? code,
    String? message,
    dynamic data,
  }) {
    return PreferenceResponse(
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
