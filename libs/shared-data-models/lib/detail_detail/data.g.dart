// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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
      processor: json['processor'] as String?,
      osVersion: json['osVersion'] as String?,
      joiningFees: (json['joiningFees'] as num?)?.toDouble(),
      dailyFees: (json['dailyFees'] as num?)?.toDouble(),
      isSelected: json['isSelected'],
      imageUrl: json['imageUrl'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
      'processor': instance.processor,
      'osVersion': instance.osVersion,
      'joiningFees': instance.joiningFees,
      'dailyFees': instance.dailyFees,
      'isSelected': instance.isSelected,
      'imageUrl': instance.imageUrl,
    };
