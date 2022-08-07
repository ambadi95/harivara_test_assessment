import 'dart:convert';

import 'package:equatable/equatable.dart';

class PasscodeRequestAgent extends Equatable {
  final String? passcode;
  final String? type;
  final String? y9AgentId;

  const PasscodeRequestAgent({this.passcode, this.type, this.y9AgentId});

  factory PasscodeRequestAgent.fromMap(Map<String, dynamic> data) {
    return PasscodeRequestAgent(
      passcode: data['passcode'] as String?,
      type: data['type'] as String?,
      y9AgentId: data['y9AgentId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'passcode': passcode,
        'type': type,
        'y9AgentId': y9AgentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PasscodeRequestAgent].
  factory PasscodeRequestAgent.fromJson(String data) {
    return PasscodeRequestAgent.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PasscodeRequestAgent] to a JSON string.
  String toJson() => json.encode(toMap());

  PasscodeRequestAgent copyWith({
    String? passcode,
    String? type,
    String? y9AgentId,
  }) {
    return PasscodeRequestAgent(
      passcode: passcode ?? this.passcode,
      type: type ?? this.type,
      y9AgentId: y9AgentId ?? this.y9AgentId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [passcode, type, y9AgentId];
}
