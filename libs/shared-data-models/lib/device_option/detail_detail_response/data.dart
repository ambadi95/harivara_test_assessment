import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
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
	final String? processor;
	final String? osVersion;
	final double? joiningFees;
	final double? dailyFees;
	final dynamic isSelected;
	final dynamic imageUrl;
	final double? rretailPrice;

	const Data({
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
		this.processor, 
		this.osVersion, 
		this.joiningFees, 
		this.dailyFees, 
		this.isSelected, 
		this.imageUrl, 
		this.rretailPrice, 
	});

	factory Data.fromMap(Map<String, dynamic> data) => Data(
				deviceId: data['deviceId'] as int?,
				brand: data['brand'] as String?,
				modelNumber: data['modelNumber'] as String?,
				humanInterfaceInput: data['humanInterfaceInput'] as String?,
				wirelessCareer: data['wirelessCareer'] as String?,
				cellularTechnology: data['cellularTechnology'] as String?,
				operatingSystem: data['operatingSystem'] as String?,
				memory: data['memory'] as String?,
				waterResistanceLevel: data['waterResistanceLevel'] as String?,
				color: data['color'] as String?,
				price: data['price'] as dynamic,
				emi: data['emi'] as dynamic,
				rateOfInterest: data['rateOfInterest'] as dynamic,
				amountToPay: data['amountToPay'] as dynamic,
				processor: data['processor'] as String?,
				osVersion: data['osVersion'] as String?,
				joiningFees: data['joiningFees'] as double?,
				dailyFees: data['dailyFees'] as double?,
				isSelected: data['isSelected'] as dynamic,
				imageUrl: data['imageUrl'] as dynamic,
				rretailPrice: data['rretailPrice'] as double?,
			);

	Map<String, dynamic> toMap() => {
				'deviceId': deviceId,
				'brand': brand,
				'modelNumber': modelNumber,
				'humanInterfaceInput': humanInterfaceInput,
				'wirelessCareer': wirelessCareer,
				'cellularTechnology': cellularTechnology,
				'operatingSystem': operatingSystem,
				'memory': memory,
				'waterResistanceLevel': waterResistanceLevel,
				'color': color,
				'price': price,
				'emi': emi,
				'rateOfInterest': rateOfInterest,
				'amountToPay': amountToPay,
				'processor': processor,
				'osVersion': osVersion,
				'joiningFees': joiningFees,
				'dailyFees': dailyFees,
				'isSelected': isSelected,
				'imageUrl': imageUrl,
				'rretailPrice': rretailPrice,
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
		String? processor,
		String? osVersion,
		double? joiningFees,
		double? dailyFees,
		dynamic isSelected,
		dynamic imageUrl,
		double? rretailPrice,
	}) {
		return Data(
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
			processor: processor ?? this.processor,
			osVersion: osVersion ?? this.osVersion,
			joiningFees: joiningFees ?? this.joiningFees,
			dailyFees: dailyFees ?? this.dailyFees,
			isSelected: isSelected ?? this.isSelected,
			imageUrl: imageUrl ?? this.imageUrl,
			rretailPrice: rretailPrice ?? this.rretailPrice,
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
				processor,
				osVersion,
				joiningFees,
				dailyFees,
				isSelected,
				imageUrl,
				rretailPrice,
		];
	}
}
