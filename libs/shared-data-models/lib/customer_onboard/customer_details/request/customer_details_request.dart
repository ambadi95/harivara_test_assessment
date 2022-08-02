import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_details_request.g.dart';

@JsonSerializable()
class CustomerDetailsRequest extends Equatable {
	final int? customerId;
	final String? nidaNo;
	final String? mobileNo;
	final String? address;
	final String? firstName;
	final String? lastName;
	final String? birthdate;
	final String? gender;
	final String? profession;
	final String? emailId;
	final String? poBoxNumber;
	final String? region;
	final String? district;

	const CustomerDetailsRequest({
		this.customerId, 
		this.nidaNo, 
		this.mobileNo, 
		this.address, 
		this.firstName, 
		this.lastName, 
		this.birthdate, 
		this.gender, 
		this.profession, 
		this.emailId, 
		this.poBoxNumber, 
		this.region, 
		this.district, 
	});

	factory CustomerDetailsRequest.fromJson(Map<String, dynamic> json) {
		return _$CustomerDetailsRequestFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CustomerDetailsRequestToJson(this);

		CustomerDetailsRequest copyWith({
		int? customerId,
		String? nidaNo,
		String? mobileNo,
		String? address,
		String? firstName,
		String? lastName,
		String? birthdate,
		String? gender,
		String? profession,
		String? emailId,
		String? poBoxNumber,
		String? region,
		String? district,
	}) {
		return CustomerDetailsRequest(
			customerId: customerId ?? this.customerId,
			nidaNo: nidaNo ?? this.nidaNo,
			mobileNo: mobileNo ?? this.mobileNo,
			address: address ?? this.address,
			firstName: firstName ?? this.firstName,
			lastName: lastName ?? this.lastName,
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
				nidaNo,
				mobileNo,
				address,
				firstName,
				lastName,
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
