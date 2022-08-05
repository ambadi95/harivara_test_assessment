import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'agent_sign_up_response.g.dart';

@JsonSerializable()
class AgentSignUpResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const AgentSignUpResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AgentSignUpResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentSignUpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentSignUpResponseToJson(this);

  AgentSignUpResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return AgentSignUpResponse(
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
