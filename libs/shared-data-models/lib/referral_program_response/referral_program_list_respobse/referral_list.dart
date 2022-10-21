import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReferralList extends Equatable {
  final String? customerName;
  final String? status;
  final String? lastInvite;

  const ReferralList({this.customerName, this.status, this.lastInvite});

  factory ReferralList.fromMap(Map<String, dynamic> data) => ReferralList(
        customerName: data['customerName'] as String?,
        status: data['status'] as String?,
        lastInvite: data['lastInvite'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'customerName': customerName,
        'status': status,
        'lastInvite': lastInvite,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReferralList].
  factory ReferralList.fromJson(String data) {
    return ReferralList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReferralList] to a JSON string.
  String toJson() => json.encode(toMap());

  ReferralList copyWith({
    String? customerName,
    String? status,
    String? lastInvite,
  }) {
    return ReferralList(
      customerName: customerName ?? this.customerName,
      status: status ?? this.status,
      lastInvite: lastInvite ?? this.lastInvite,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [customerName, status, lastInvite];
}
