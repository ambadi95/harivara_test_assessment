import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? y9AgentId;
  final String? firstName;
  final String? lastName;
  final dynamic middleName;
  final String? mobileNo;
  final String? address;
  final String? poBoxNumber;
  final String? region;
  final String? district;
  final String? imageUrl;

  const Datum({
    this.y9AgentId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.mobileNo,
    this.address,
    this.poBoxNumber,
    this.region,
    this.district,
    this.imageUrl,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        y9AgentId: data['y9AgentId'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        middleName: data['middleName'] as dynamic,
        mobileNo: data['mobileNo'] as String?,
        address: data['address'] as String?,
        poBoxNumber: data['poBoxNumber'] as String?,
        region: data['region'] as String?,
        district: data['district'] as String?,
        imageUrl: data['imageUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'y9AgentId': y9AgentId,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'mobileNo': mobileNo,
        'address': address,
        'poBoxNumber': poBoxNumber,
        'region': region,
        'district': district,
        'imageUrl': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    String? y9AgentId,
    String? firstName,
    String? lastName,
    dynamic middleName,
    String? mobileNo,
    String? address,
    String? poBoxNumber,
    String? region,
    String? district,
    String? imageUrl,
  }) {
    return Datum(
      y9AgentId: y9AgentId ?? this.y9AgentId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      mobileNo: mobileNo ?? this.mobileNo,
      address: address ?? this.address,
      poBoxNumber: poBoxNumber ?? this.poBoxNumber,
      region: region ?? this.region,
      district: district ?? this.district,
      imageUrl: imageUrl ?? this.imageUrl,
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
      mobileNo,
      address,
      poBoxNumber,
      region,
      district,
      imageUrl,
    ];
  }
}
