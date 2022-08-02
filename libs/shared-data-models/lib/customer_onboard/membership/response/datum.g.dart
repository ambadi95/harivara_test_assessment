// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      deviceId: json['deviceId'] as int?,
      brand: json['brand'] as String?,
      modelNumber: json['modelNumber'] as String?,
      humanInterfaceInput: json['humanInterfaceInput'] as String?,
      wirelessCareer: json['wirelessCareer'] as String?,
      cellularTechnology: json['cellularTechnology'] as String?,
      operatingSystem: json['operatingSystem'] as String?,
      memory: json['memory'] as String?,
      waterResistanceLevel: json['waterResistanceLevel'] as String?,
      color: json['color'] as String?,
      price: json['price'],
      emi: json['emi'],
      rateOfInterest: json['rateOfInterest'],
      amountToPay: json['amountToPay'],
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'brand': instance.brand,
      'modelNumber': instance.modelNumber,
      'humanInterfaceInput': instance.humanInterfaceInput,
      'wirelessCareer': instance.wirelessCareer,
      'cellularTechnology': instance.cellularTechnology,
      'operatingSystem': instance.operatingSystem,
      'memory': instance.memory,
      'waterResistanceLevel': instance.waterResistanceLevel,
      'color': instance.color,
      'price': instance.price,
      'emi': instance.emi,
      'rateOfInterest': instance.rateOfInterest,
      'amountToPay': instance.amountToPay,
      'isSelected': instance.isSelected,
    };
