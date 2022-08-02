import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
	final int? deviceId;
	final String? brand;
	final String? modelNumber;
	final String? humanInterfaceInput;
	final String? wirelessCareer;
	final String? cellularTechnology;
	final String? operatingSystem;
	final String? memory;
	final String? waterResistanceLevel;
	final String? color;
	final dynamic price;
	final dynamic emi;
	final dynamic rateOfInterest;
	final dynamic amountToPay;
	final bool? isSelected;

	const Datum({
		this.deviceId, 
		this.brand, 
		this.modelNumber, 
		this.humanInterfaceInput, 
		this.wirelessCareer, 
		this.cellularTechnology, 
		this.operatingSystem, 
		this.memory, 
		this.waterResistanceLevel, 
		this.color, 
		this.price, 
		this.emi, 
		this.rateOfInterest, 
		this.amountToPay, 
		this.isSelected, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);

		Datum copyWith({
		int? deviceId,
		String? brand,
		String? modelNumber,
		String? humanInterfaceInput,
		String? wirelessCareer,
		String? cellularTechnology,
		String? operatingSystem,
		String? memory,
		String? waterResistanceLevel,
		String? color,
		dynamic price,
		dynamic emi,
		dynamic rateOfInterest,
		dynamic amountToPay,
		bool? isSelected,
	}) {
		return Datum(
			deviceId: deviceId ?? this.deviceId,
			brand: brand ?? this.brand,
			modelNumber: modelNumber ?? this.modelNumber,
			humanInterfaceInput: humanInterfaceInput ?? this.humanInterfaceInput,
			wirelessCareer: wirelessCareer ?? this.wirelessCareer,
			cellularTechnology: cellularTechnology ?? this.cellularTechnology,
			operatingSystem: operatingSystem ?? this.operatingSystem,
			memory: memory ?? this.memory,
			waterResistanceLevel: waterResistanceLevel ?? this.waterResistanceLevel,
			color: color ?? this.color,
			price: price ?? this.price,
			emi: emi ?? this.emi,
			rateOfInterest: rateOfInterest ?? this.rateOfInterest,
			amountToPay: amountToPay ?? this.amountToPay,
			isSelected: isSelected ?? this.isSelected,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				deviceId,
				brand,
				modelNumber,
				humanInterfaceInput,
				wirelessCareer,
				cellularTechnology,
				operatingSystem,
				memory,
				waterResistanceLevel,
				color,
				price,
				emi,
				rateOfInterest,
				amountToPay,
				isSelected,
		];
	}
}
