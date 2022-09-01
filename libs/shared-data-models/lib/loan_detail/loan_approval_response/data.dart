import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? deviceId;
  final String? loanStatus;

  const Data({this.deviceId, this.loanStatus});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        deviceId: data['deviceId'] as int?,
        loanStatus: data['loanStatus'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'deviceId': deviceId,
        'loanStatus': loanStatus,
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
    String? loanStatus,
  }) {
    return Data(
      deviceId: deviceId ?? this.deviceId,
      loanStatus: loanStatus ?? this.loanStatus,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [deviceId, loanStatus];
}
