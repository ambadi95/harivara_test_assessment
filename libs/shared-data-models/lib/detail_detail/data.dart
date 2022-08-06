import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

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
    ];
  }
}
