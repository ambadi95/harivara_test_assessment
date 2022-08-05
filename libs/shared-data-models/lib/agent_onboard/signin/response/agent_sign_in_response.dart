import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'agent_sign_in_response.g.dart';

@JsonSerializable()
class AgentSignInResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const AgentSignInResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AgentSignInResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentSignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentSignInResponseToJson(this);

  AgentSignInResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return AgentSignInResponse(
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
