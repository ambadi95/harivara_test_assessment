import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetAgentResponse extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const GetAgentResponse({this.code, this.data, this.message, this.status});

  factory GetAgentResponse.fromMap(Map<String, dynamic> data) {
    return GetAgentResponse(
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
  /// Parses the string and returns the resulting Json object as [GetAgentResponse].
  factory GetAgentResponse.fromJson(String data) {
    return GetAgentResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetAgentResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetAgentResponse copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return GetAgentResponse(
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
