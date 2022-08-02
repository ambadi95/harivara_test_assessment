import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'membership_request.g.dart';

@JsonSerializable()
class MembershipRequest extends Equatable {
	final int? customerId;

	const MembershipRequest({this.customerId});

	factory MembershipRequest.fromJson(Map<String, dynamic> json) {
		return _$MembershipRequestFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MembershipRequestToJson(this);

		MembershipRequest copyWith({
		int? customerId,
	}) {
		return MembershipRequest(
			customerId: customerId ?? this.customerId,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [customerId];
}
