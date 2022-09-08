import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? accountState;
  final String? clientEncodedId;
  final int? deviceId;
  final String? loanEncodedKey;
  final String? loanId;

  const Data({
    this.accountState,
    this.clientEncodedId,
    this.deviceId,
    this.loanEncodedKey,
    this.loanId,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        accountState: data['accountState'] as String?,
        clientEncodedId: data['clientEncodedId'] as String?,
        deviceId: data['deviceId'] as int?,
        loanEncodedKey: data['loanEncodedKey'] as String?,
        loanId: data['loanId'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'accountState': accountState,
        'clientEncodedId': clientEncodedId,
        'deviceId': deviceId,
        'loanEncodedKey': loanEncodedKey,
        'loanId': loanId,
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
    String? accountState,
    String? clientEncodedId,
    int? deviceId,
    String? loanEncodedKey,
    String? loanId,
  }) {
    return Data(
      accountState: accountState ?? this.accountState,
      clientEncodedId: clientEncodedId ?? this.clientEncodedId,
      deviceId: deviceId ?? this.deviceId,
      loanEncodedKey: loanEncodedKey ?? this.loanEncodedKey,
      loanId: loanId ?? this.loanId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accountState,
      clientEncodedId,
      deviceId,
      loanEncodedKey,
      loanId,
    ];
  }
}
