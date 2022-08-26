import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class AgentsNearByResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<Datum>? data;

  const AgentsNearByResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AgentsNearByResponse.fromMap(Map<String, dynamic> data) {
    return AgentsNearByResponse(
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
  /// Parses the string and returns the resulting Json object as [AgentsNearByResponse].
  factory AgentsNearByResponse.fromJson(String data) {
    return AgentsNearByResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AgentsNearByResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  AgentsNearByResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<Datum>? data,
  }) {
    return AgentsNearByResponse(
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
