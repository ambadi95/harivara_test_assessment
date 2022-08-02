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
	final String? poBoxNumber;
	final String? region;
	final String? district;

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
		this.poBoxNumber, 
		this.region, 
		this.district, 
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
		String? poBoxNumber,
		String? region,
		String? district,
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
			poBoxNumber: poBoxNumber ?? this.poBoxNumber,
			region: region ?? this.region,
			district: district ?? this.district,
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
				poBoxNumber,
				region,
				district,
		];
	}
}
