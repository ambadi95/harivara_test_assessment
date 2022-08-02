import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passcode_request.g.dart';

@JsonSerializable()
class PasscodeRequest extends Equatable {
	final int? id;
	final String? type;
	final String? passcode;

	const PasscodeRequest({this.id, this.type, this.passcode});

	factory PasscodeRequest.fromJson(Map<String, dynamic> json) {
		return _$PasscodeRequestFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PasscodeRequestToJson(this);

		PasscodeRequest copyWith({
		int? id,
		String? type,
		String? passcode,
	}) {
		return PasscodeRequest(
			id: id ?? this.id,
			type: type ?? this.type,
			passcode: passcode ?? this.passcode,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [id, type, passcode];
}
