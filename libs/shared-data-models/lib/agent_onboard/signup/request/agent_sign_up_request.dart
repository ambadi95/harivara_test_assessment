import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_sign_up_request.g.dart';

@JsonSerializable()
class AgentSignUpRequest extends Equatable {
	final String? nidaNo;
	final String? y9AgentId;

	const AgentSignUpRequest({this.nidaNo, this.y9AgentId});

	factory AgentSignUpRequest.fromJson(Map<String, dynamic> json) {
		return _$AgentSignUpRequestFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AgentSignUpRequestToJson(this);

		AgentSignUpRequest copyWith({
		String? nidaNo,
		String? y9AgentId,
	}) {
		return AgentSignUpRequest(
			nidaNo: nidaNo ?? this.nidaNo,
			y9AgentId: y9AgentId ?? this.y9AgentId,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [nidaNo, y9AgentId];
}
