import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'device_list_response.g.dart';

@JsonSerializable()
class DeviceListResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<Datum>? data;

  const DeviceListResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory DeviceListResponse.fromJson(Map<String, dynamic> json) {
    return _$DeviceListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeviceListResponseToJson(this);

  DeviceListResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<Datum>? data,
  }) {
    return DeviceListResponse(
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
