import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class CustomerSelectDeviceResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const CustomerSelectDeviceResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory CustomerSelectDeviceResponse.fromMap(Map<String, dynamic> data) {
    return CustomerSelectDeviceResponse(
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
  /// Parses the string and returns the resulting Json object as [CustomerSelectDeviceResponse].
  factory CustomerSelectDeviceResponse.fromJson(String data) {
    return CustomerSelectDeviceResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CustomerSelectDeviceResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CustomerSelectDeviceResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return CustomerSelectDeviceResponse(
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
