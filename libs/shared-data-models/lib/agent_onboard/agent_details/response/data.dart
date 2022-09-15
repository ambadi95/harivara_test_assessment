import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? y9AgentId;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? nidaNo;
  final String? mobileNo;
  final String? birthDate;
  final String? gender;
  final String? emailId;
  final String? address;
  final String? district;
  final String? region;
  final double? latitude;
  final double? longitude;
  final String? roleName;

  const Data({
    this.y9AgentId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.nidaNo,
    this.mobileNo,
    this.birthDate,
    this.gender,
    this.emailId,
    this.address,
    this.district,
    this.region,
    this.latitude,
    this.longitude,
    this.roleName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? y9AgentId,
    String? firstName,
    String? lastName,
    String? middleName,
    String? nidaNo,
    String? mobileNo,
    String? birthDate,
    String? gender,
    String? emailId,
    String? address,
    String? district,
    String? region,
    double? latitude,
    double? longitude,
    String? roleName,
  }) {
    return Data(
      y9AgentId: y9AgentId ?? this.y9AgentId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      nidaNo: nidaNo ?? this.nidaNo,
      mobileNo: mobileNo ?? this.mobileNo,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      emailId: emailId ?? this.emailId,
      address: address ?? this.address,
      district: district ?? this.district,
      region: region ?? this.region,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      roleName: roleName ?? this.roleName,
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
      birthDate,
      gender,
      emailId,
      address,
      district,
      region,
      latitude,
      longitude,
      roleName,
    ];
  }
}
