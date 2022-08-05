import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? y9AgentId;
  final String? firstName;
  final String? lastName;
  final dynamic middleName;
  final String? nidaNo;
  final String? mobileNo;
  final dynamic birthdate;
  final String? gender;
  final String? emailId;
  final String? address;

  const Data({
    this.y9AgentId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.nidaNo,
    this.mobileNo,
    this.birthdate,
    this.gender,
    this.emailId,
    this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? y9AgentId,
    String? firstName,
    String? lastName,
    dynamic middleName,
    String? nidaNo,
    String? mobileNo,
    dynamic birthdate,
    String? gender,
    String? emailId,
    String? address,
  }) {
    return Data(
      y9AgentId: y9AgentId ?? this.y9AgentId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      nidaNo: nidaNo ?? this.nidaNo,
      mobileNo: mobileNo ?? this.mobileNo,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      emailId: emailId ?? this.emailId,
      address: address ?? this.address,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      y9AgentId,
      firstName,
      lastName,
      middleName,
      nidaNo,
      mobileNo,
      birthdate,
      gender,
      emailId,
      address,
    ];
  }
}
