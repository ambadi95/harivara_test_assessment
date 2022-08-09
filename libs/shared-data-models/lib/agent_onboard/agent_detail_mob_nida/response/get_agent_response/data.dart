import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? address;
  final String? birthDate;
  final String? emailId;
  final String? firstName;
  final String? gender;
  final String? lastName;
  final String? middleName;
  final String? mobileNo;
  final String? nidaNo;
  final String? y9AgentId;

  const Data({
    this.address,
    this.birthDate,
    this.emailId,
    this.firstName,
    this.gender,
    this.lastName,
    this.middleName,
    this.mobileNo,
    this.nidaNo,
    this.y9AgentId,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        address: data['address'] as String?,
        birthDate: data['birthDate'] as String?,
        emailId: data['emailId'] as String?,
        firstName: data['firstName'] as String?,
        gender: data['gender'] as String?,
        lastName: data['lastName'] as String?,
        middleName: data['middleName'] as String?,
        mobileNo: data['mobileNo'] as String?,
        nidaNo: data['nidaNo'] as String?,
        y9AgentId: data['y9AgentId'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'address': address,
        'birthDate': birthDate,
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
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    String? address,
    String? birthDate,
    String? emailId,
    String? firstName,
    String? gender,
    String? lastName,
    String? middleName,
    String? mobileNo,
    String? nidaNo,
    String? y9AgentId,
  }) {
    return Data(
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
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
      address,
      birthDate,
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
