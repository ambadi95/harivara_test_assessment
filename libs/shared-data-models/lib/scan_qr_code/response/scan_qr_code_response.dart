import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';


part 'scan_qr_code_response.g.dart';

@JsonSerializable()
class ScanQRCodeResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const ScanQRCodeResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory ScanQRCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$ScanQRCodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScanQRCodeResponseToJson(this);

  ScanQRCodeResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return ScanQRCodeResponse(
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
