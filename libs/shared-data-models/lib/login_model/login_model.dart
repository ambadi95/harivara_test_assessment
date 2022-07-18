import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginModel {
  String? idToken;
  String? email;

  LoginModel({this.email, this.idToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json['email'] as String,
        idToken: json['idToken'] as String,
      );
}
