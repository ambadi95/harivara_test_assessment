import 'package:equatable/equatable.dart';
import 'package:shared_data_models/auth/auth_type.dart';

class AuthDetails extends Equatable {
  final AuthType authType;
  final String authValue;

  const AuthDetails(
    this.authType,
    this.authValue,
  );

  AuthDetails copyWith({
    AuthType? authType,
    String? authValue,
  }) {
    return AuthDetails(
      authType ?? this.authType,
      authValue ?? this.authValue,
    );
  }

  factory AuthDetails.fromJson(Map<String, dynamic> json) => AuthDetails(
        AuthType.fromString(json['authType']),
        json['authValue'],
      );

  Map<String, dynamic> toJson(AuthDetails authDetails) {
    return {
      'authType': authDetails.authType.toString(),
      'authValue': authDetails.authValue,
    };
  }

  @override
  List<Object?> get props => [
        authType,
        authValue,
      ];
}
