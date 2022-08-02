import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verification_request.g.dart';

@JsonSerializable()
class OtpVerificationRequest extends Equatable {
  final String? id;
  final String? type;
  final String? otp;

  const OtpVerificationRequest({this.id, this.type, this.otp});

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpVerificationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpVerificationRequestToJson(this);

  OtpVerificationRequest copyWith({
    String? id,
    String? type,
    String? otp,
  }) {
    return OtpVerificationRequest(
      id: id ?? this.id,
      type: type ?? this.type,
      otp: otp ?? this.otp,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type, otp];
}
