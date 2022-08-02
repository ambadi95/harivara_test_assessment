import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final Data? data;

	const SignUpResponse({this.status, this.code, this.message, this.data});

	factory SignUpResponse.fromJson(Map<String, dynamic> json) {
		return _$SignUpResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

		SignUpResponse copyWith({
		bool? status,
		String? code,
		String? message,
		Data? data,
	}) {
		return SignUpResponse(
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
