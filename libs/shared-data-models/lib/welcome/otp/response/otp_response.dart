import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final Data? data;

	const OtpResponse({this.status, this.code, this.message, this.data});

	factory OtpResponse.fromJson(Map<String, dynamic> json) {
		return _$OtpResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OtpResponseToJson(this);

		OtpResponse copyWith({
		bool? status,
		String? code,
		String? message,
		Data? data,
	}) {
		return OtpResponse(
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
