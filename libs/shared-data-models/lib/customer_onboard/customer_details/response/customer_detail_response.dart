import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'customer_detail_response.g.dart';

@JsonSerializable()
class CustomerDetailResponse extends Equatable {
	final bool? status;
	final String? code;
	final String? message;
	final Data? data;

	const CustomerDetailResponse({
		this.status, 
		this.code, 
		this.message, 
		this.data, 
	});

	factory CustomerDetailResponse.fromJson(Map<String, dynamic> json) {
		return _$CustomerDetailResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CustomerDetailResponseToJson(this);

		CustomerDetailResponse copyWith({
		bool? status,
		String? code,
		String? message,
		Data? data,
	}) {
		return CustomerDetailResponse(
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
