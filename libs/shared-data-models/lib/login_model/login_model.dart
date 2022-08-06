import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginModel {
  String? mobileNumber;
  String? password;

  LoginModel({this.mobileNumber, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        mobileNumber: json['mobileNumber'] as String,
        password: json['password'] as String,
      );
}
