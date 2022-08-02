import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'otp_verification_response.g.dart';

@JsonSerializable()
class OtpVerificationResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final Data? data;

	const OtpVerificationResponse({
		this.status, 
		this.code, 
		this.message, 
		this.data, 
	});

	factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
		return _$OtpVerificationResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OtpVerificationResponseToJson(this);

		OtpVerificationResponse copyWith({
		bool? status,
		String? code,
		String? message,
		Data? data,
	}) {
		return OtpVerificationResponse(
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
