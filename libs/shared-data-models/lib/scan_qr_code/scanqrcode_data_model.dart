import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ScanQRCodeModel {
  String? customerId;
  int? deviceId;
  String? imei1;
  String? imei2;

  ScanQRCodeModel({this.customerId, this.deviceId, this.imei1, this.imei2});

  factory ScanQRCodeModel.fromJson(Map<String, dynamic> json) => ScanQRCodeModel(
    customerId: json['mobileNumber'] as String,
    deviceId: json['password'] as int,
    imei1: json['imei1'] as String,
    imei2: json['imei2'] as String,
  );
}
