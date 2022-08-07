import 'dart:convert';

import 'package:equatable/equatable.dart';

class AgentDetailsRequest extends Equatable {
  final String? birthdate;
  final String? emailId;
  final String? firstName;
  final String? gender;
  final String? lastName;
  final String? middleName;
  final String? mobileNo;
  final String? nidaNo;
  final String? y9AgentId;

  const AgentDetailsRequest({
    this.birthdate,
    this.emailId,
    this.firstName,
    this.gender,
    this.lastName,
    this.middleName,
    this.mobileNo,
    this.nidaNo,
    this.y9AgentId,
  });

  factory AgentDetailsRequest.fromMap(Map<String, dynamic> data) {
    return AgentDetailsRequest(
      birthdate: data['birthdate'] as String?,
      emailId: data['emailId'] as String?,
      firstName: data['firstName'] as String?,
      gender: data['gender'] as String?,
      lastName: data['lastName'] as String?,
      middleName: data['middleName'] as String?,
      mobileNo: data['mobileNo'] as String?,
      nidaNo: data['nidaNo'] as String?,
      y9AgentId: data['y9AgentId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'birthdate': birthdate,
        'emailId': emailId,
        'firstName': firstName,
        'gender': gender,
        'lastName': lastName,
        'middleName': middleName,
        'mobileNo': mobileNo,
        'nidaNo': nidaNo,
        'y9AgentId': y9AgentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AgentDetailsRequest].
  factory AgentDetailsRequest.fromJson(String data) {
    return AgentDetailsRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AgentDetailsRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  AgentDetailsRequest copyWith({
    String? birthdate,
    String? emailId,
    String? firstName,
    String? gender,
    String? lastName,
    String? middleName,
    String? mobileNo,
    String? nidaNo,
    String? y9AgentId,
  }) {
    return AgentDetailsRequest(
      birthdate: birthdate ?? this.birthdate,
      emailId: emailId ?? this.emailId,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      mobileNo: mobileNo ?? this.mobileNo,
      nidaNo: nidaNo ?? this.nidaNo,
      y9AgentId: y9AgentId ?? this.y9AgentId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      birthdate,
      emailId,
      firstName,
      gender,
      lastName,
      middleName,
      mobileNo,
      nidaNo,
      y9AgentId,
    ];
  }
}
