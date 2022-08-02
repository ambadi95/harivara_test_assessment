import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequest extends Equatable {
  final String? id;
  final String? type;

  const OtpRequest({this.id, this.type});

  factory OtpRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);

  OtpRequest copyWith({
    String? id,
    String? type,
  }) {
    return OtpRequest(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type];
}
