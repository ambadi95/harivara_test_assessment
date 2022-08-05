import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'customer_sign_in_response.g.dart';

@JsonSerializable()
class CustomerSignInResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const CustomerSignInResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory CustomerSignInResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerSignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerSignInResponseToJson(this);

  CustomerSignInResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return CustomerSignInResponse(
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
