import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequest extends Equatable {
  final String? id;
  final String? type;
  final String? event;
  final String? mobile;

  const OtpRequest({this.id, this.type,this.event,this.mobile});

  factory OtpRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);

  OtpRequest copyWith({
    String? id,
    String? type,
    String? event,
    String? mobile
  }) {
    return OtpRequest(
      id: id ?? this.id,
      type: type ?? this.type,
      event: event??this.event,
      mobile: mobile ?? this.mobile
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type,event,mobile];
}
