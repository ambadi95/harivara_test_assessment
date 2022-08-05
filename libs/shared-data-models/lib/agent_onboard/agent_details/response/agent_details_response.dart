import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'agent_details_response.g.dart';

@JsonSerializable()
class AgentDetailsResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const AgentDetailsResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AgentDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentDetailsResponseToJson(this);

  AgentDetailsResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return AgentDetailsResponse(
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
