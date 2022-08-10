import 'dart:convert';

import 'package:equatable/equatable.dart';

class AgentLoginByMobileAgentIdRequest extends Equatable {
	final String? mobileNumber;
	final String? y9AgentId;

	const AgentLoginByMobileAgentIdRequest({
		this.mobileNumber, 
		this.y9AgentId, 
	});

	factory AgentLoginByMobileAgentIdRequest.fromMap(Map<String, dynamic> data) {
		return AgentLoginByMobileAgentIdRequest(
			mobileNumber: data['mobileNumber'] as String?,
			y9AgentId: data['y9AgentId'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'mobileNumber': mobileNumber,
				'y9AgentId': y9AgentId,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AgentLoginByMobileAgentIdRequest].
	factory AgentLoginByMobileAgentIdRequest.fromJson(String data) {
		return AgentLoginByMobileAgentIdRequest.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AgentLoginByMobileAgentIdRequest] to a JSON string.
	String toJson() => json.encode(toMap());

	AgentLoginByMobileAgentIdRequest copyWith({
		String? mobileNumber,
		String? y9AgentId,
	}) {
		return AgentLoginByMobileAgentIdRequest(
			mobileNumber: mobileNumber ?? this.mobileNumber,
			y9AgentId: y9AgentId ?? this.y9AgentId,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [mobileNumber, y9AgentId];
}
