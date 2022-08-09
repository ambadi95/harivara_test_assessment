import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetAgentRequest extends Equatable {
  final String? nidaNo;
  final String? y9AgentId;

  const GetAgentRequest({this.nidaNo, this.y9AgentId});

  factory GetAgentRequest.fromMap(Map<String, dynamic> data) {
    return GetAgentRequest(
      nidaNo: data['nidaNo'] as String?,
      y9AgentId: data['y9AgentId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'nidaNo': nidaNo,
        'y9AgentId': y9AgentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetAgentRequest].
  factory GetAgentRequest.fromJson(String data) {
    return GetAgentRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetAgentRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  GetAgentRequest copyWith({
    String? nidaNo,
    String? y9AgentId,
  }) {
    return GetAgentRequest(
      nidaNo: nidaNo ?? this.nidaNo,
      y9AgentId: y9AgentId ?? this.y9AgentId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [nidaNo, y9AgentId];
}
