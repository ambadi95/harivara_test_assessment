import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? customerId;
  final String? firstName;
  final String? lastName;
  final dynamic middleName;
  final String? nidaNo;
  final String? address;
  final String? mobileNo;
  final String? birthdate;
  final String? gender;
  final dynamic profession;
  final String? emailId;
  final String? organization;
  final String? organizationType;
  final String? region;
  final String? district;
  final int? referenceId;
  final int? deviceId;
  final String? y9AgentId;

  const Data({
    this.customerId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.nidaNo,
    this.address,
    this.mobileNo,
    this.birthdate,
    this.gender,
    this.profession,
    this.emailId,
    this.organization,
    this.organizationType,
    this.region,
    this.district,
    this.referenceId,
    this.deviceId,
    this.y9AgentId
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? customerId,
    String? firstName,
    String? lastName,
    dynamic middleName,
    String? nidaNo,
    String? address,
    String? mobileNo,
    String? birthdate,
    String? gender,
    dynamic profession,
    String? emailId,
    String? organization,
    String? organizationType,
    String? region,
    String? district,
    int? referenceId,
    int? deviceId,
    String? y9AgentId
  }) {
    return Data(
        customerId: customerId ?? this.customerId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        nidaNo: nidaNo ?? this.nidaNo,
        address: address ?? this.address,
        mobileNo: mobileNo ?? this.mobileNo,
        birthdate: birthdate ?? this.birthdate,
        gender: gender ?? this.gender,
        profession: profession ?? this.profession,
        emailId: emailId ?? this.emailId,
      organization: organization ?? this.organization,
        organizationType: organizationType ?? this.organizationType,
        region: region ?? this.region,
        district: district ?? this.district,
        referenceId: referenceId ?? this.referenceId,
        deviceId: deviceId ?? this.deviceId,
      y9AgentId: y9AgentId ?? this.y9AgentId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      customerId,
      firstName,
      lastName,
      middleName,
      nidaNo,
      address,
      mobileNo,
      birthdate,
      gender,
      profession,
      emailId,
      organization,
      organizationType,
      region,
      district,
      referenceId,
      deviceId,
      y9AgentId
    ];
  }
}
