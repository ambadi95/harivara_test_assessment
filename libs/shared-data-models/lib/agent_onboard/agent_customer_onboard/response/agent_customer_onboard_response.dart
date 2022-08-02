import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'agent_customer_onboard_response.g.dart';

@JsonSerializable()
class AgentCustomerOnboardResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final Data? data;

	const AgentCustomerOnboardResponse({
		this.status, 
		this.code, 
		this.message, 
		this.data, 
	});

	factory AgentCustomerOnboardResponse.fromJson(Map<String, dynamic> json) {
		return _$AgentCustomerOnboardResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AgentCustomerOnboardResponseToJson(this);

		AgentCustomerOnboardResponse copyWith({
		bool? status,
		String? code,
		String? message,
		Data? data,
	}) {
		return AgentCustomerOnboardResponse(
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
