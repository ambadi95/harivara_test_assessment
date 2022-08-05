import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_customer_details_response.g.dart';

@JsonSerializable()
class GetCustomerDetailsResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const GetCustomerDetailsResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory GetCustomerDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCustomerDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCustomerDetailsResponseToJson(this);

  GetCustomerDetailsResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return GetCustomerDetailsResponse(
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
