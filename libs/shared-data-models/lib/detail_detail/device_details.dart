import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'device_details.g.dart';

@JsonSerializable()
class DeviceDetails extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const DeviceDetails({this.status, this.code, this.message, this.data});

  factory DeviceDetails.fromJson(Map<String, dynamic> json) {
    return _$DeviceDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeviceDetailsToJson(this);

  DeviceDetails copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return DeviceDetails(
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
