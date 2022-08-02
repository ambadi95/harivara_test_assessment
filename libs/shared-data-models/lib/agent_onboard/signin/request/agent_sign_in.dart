import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_sign_in.g.dart';

@JsonSerializable()
class AgentSignIn extends Equatable {
	final String? mobileNumber;
	final String? passcode;
	final String? y9AgentId;

	const AgentSignIn({this.mobileNumber, this.passcode, this.y9AgentId});

	factory AgentSignIn.fromJson(Map<String, dynamic> json) {
		return _$AgentSignInFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AgentSignInToJson(this);

		AgentSignIn copyWith({
		String? mobileNumber,
		String? passcode,
		String? y9AgentId,
	}) {
		return AgentSignIn(
			mobileNumber: mobileNumber ?? this.mobileNumber,
			passcode: passcode ?? this.passcode,
			y9AgentId: y9AgentId ?? this.y9AgentId,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [mobileNumber, passcode, y9AgentId];
}
