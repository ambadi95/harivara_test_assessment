import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'membership_response.g.dart';

@JsonSerializable()
class MembershipResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final List<Datum>? data;

	const MembershipResponse({
		this.status, 
		this.code, 
		this.message, 
		this.data, 
	});

	factory MembershipResponse.fromJson(Map<String, dynamic> json) {
		return _$MembershipResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MembershipResponseToJson(this);

		MembershipResponse copyWith({
		bool? status,
		String? code,
		String? message,
		List<Datum>? data,
	}) {
		return MembershipResponse(
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
