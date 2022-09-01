import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final String? y9AgentId;
	final String? firstName;
	final String? lastName;
	final String? middleName;
	final String? nidaNo;
	final String? mobileNo;
	final dynamic birthdate;
	final String? gender;
	final String? emailId;
	final String? address;
	final String? region;
	final String? district;
	final double? latitude;
	final double? longitude;

	const Datum({
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
		this.region, 
		this.district, 
		this.latitude, 
		this.longitude, 
	});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				y9AgentId: data['y9AgentId'] as String?,
				firstName: data['firstName'] as String?,
				lastName: data['lastName'] as String?,
				middleName: data['middleName'] as String?,
				nidaNo: data['nidaNo'] as String?,
				mobileNo: data['mobileNo'] as String?,
				birthdate: data['birthdate'] as dynamic,
				gender: data['gender'] as String?,
				emailId: data['emailId'] as String?,
				address: data['address'] as String?,
				region: data['region'] as String?,
				district: data['district'] as String?,
				latitude: (data['latitude'] as num?)?.toDouble(),
				longitude: (data['longitude'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toMap() => {
				'y9AgentId': y9AgentId,
				'firstName': firstName,
				'lastName': lastName,
				'middleName': middleName,
				'nidaNo': nidaNo,
				'mobileNo': mobileNo,
				'birthdate': birthdate,
				'gender': gender,
				'emailId': emailId,
				'address': address,
				'region': region,
				'district': district,
				'latitude': latitude,
				'longitude': longitude,
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
		String? middleName,
		String? nidaNo,
		String? mobileNo,
		dynamic birthdate,
		String? gender,
		String? emailId,
		String? address,
		String? region,
		String? district,
		double? latitude,
		double? longitude,
	}) {
		return Datum(
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
			region: region ?? this.region,
			district: district ?? this.district,
			latitude: latitude ?? this.latitude,
			longitude: longitude ?? this.longitude,
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
				region,
				district,
				latitude,
				longitude,
		];
	}
}
