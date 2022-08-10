import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? enrolledCustomer;
  final String? initiatedCustomer;

  const Data({this.enrolledCustomer, this.initiatedCustomer});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        enrolledCustomer: data['enrolled_customer'] as String?,
        initiatedCustomer: data['initiated_customer'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'enrolled_customer': enrolledCustomer,
        'initiated_customer': initiatedCustomer,
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
    String? enrolledCustomer,
    String? initiatedCustomer,
  }) {
    return Data(
      enrolledCustomer: enrolledCustomer ?? this.enrolledCustomer,
      initiatedCustomer: initiatedCustomer ?? this.initiatedCustomer,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [enrolledCustomer, initiatedCustomer];
}
