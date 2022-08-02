import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest extends Equatable {
  final String? nidaNo;
  final String? mobileNo;

  const SignUpRequest({this.nidaNo, this.mobileNo});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  SignUpRequest copyWith({
    String? nidaNo,
    String? mobileNo,
  }) {
    return SignUpRequest(
      nidaNo: nidaNo ?? this.nidaNo,
      mobileNo: mobileNo ?? this.mobileNo,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [nidaNo, mobileNo];
}
