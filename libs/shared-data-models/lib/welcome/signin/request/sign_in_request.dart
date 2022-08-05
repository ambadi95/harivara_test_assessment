import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequest extends Equatable {
  final String? mobileNumber;
  final String? passcode;

  const SignInRequest({this.mobileNumber, this.passcode});

  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return _$SignInRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);

  SignInRequest copyWith({
    String? mobileNumber,
    String? passcode,
  }) {
    return SignInRequest(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      passcode: passcode ?? this.passcode,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [mobileNumber, passcode];
}
