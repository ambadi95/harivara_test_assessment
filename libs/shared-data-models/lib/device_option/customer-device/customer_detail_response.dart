import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';


part 'customer_detail_response.g.dart';


@JsonSerializable()
class CustomerDeviceResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const CustomerDeviceResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory CustomerDeviceResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerDeviceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerDeviceResponseToJson(this);

  CustomerDeviceResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return CustomerDeviceResponse(
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
