import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'referral_list.dart';

class Data extends Equatable {
  final int? totalReferral;
  final int? onboardedReferral;
  final int? referralPoint;
  final List<ReferralList>? referralList;

  const Data({
    this.totalReferral,
    this.onboardedReferral,
    this.referralPoint,
    this.referralList,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        totalReferral: data['totalReferral'] as int?,
        onboardedReferral: data['onboardedReferral'] as int?,
        referralPoint: data['referralPoint'] as int?,
        referralList: (data['referralList'] as List<dynamic>?)
            ?.map((e) => ReferralList.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'totalReferral': totalReferral,
        'onboardedReferral': onboardedReferral,
        'referralPoint': referralPoint,
        'referralList': referralList?.map((e) => e.toMap()).toList(),
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
    int? totalReferral,
    int? onboardedReferral,
    int? referralPoint,
    List<ReferralList>? referralList,
  }) {
    return Data(
      totalReferral: totalReferral ?? this.totalReferral,
      onboardedReferral: onboardedReferral ?? this.onboardedReferral,
      referralPoint: referralPoint ?? this.referralPoint,
      referralList: referralList ?? this.referralList,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      totalReferral,
      onboardedReferral,
      referralPoint,
      referralList,
    ];
  }
}
