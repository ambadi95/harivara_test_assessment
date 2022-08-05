import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PasscodeRequest {
  String mobileNo;
  String password;
  String language;

  PasscodeRequest({
    required this.mobileNo,
    required this.password,
    this.language = 'en',
  });

  factory PasscodeRequest.fromJson(Map<String, dynamic> json) =>
      PasscodeRequest(
        mobileNo: json['mobileNo'] as String,
        password: json['password'] as String,
        language: json['language'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'mobileNo': mobileNo,
      'password': password,
      'language': language,
    };
  }
}
