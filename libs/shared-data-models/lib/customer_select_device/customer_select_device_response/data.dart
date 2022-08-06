import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? customerId;
  final int? deviceId;

  const Data({this.customerId, this.deviceId});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        customerId: data['customerId'] as int?,
        deviceId: data['deviceId'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'customerId': customerId,
        'deviceId': deviceId,
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
    int? customerId,
    int? deviceId,
  }) {
    return Data(
      customerId: customerId ?? this.customerId,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [customerId, deviceId];
}
