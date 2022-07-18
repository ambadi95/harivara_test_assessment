import 'package:equatable/equatable.dart';
import 'package:shared_data_models/account/account_scheme_type.dart';

class RecipientDetails extends Equatable {
  final String mobileNumber;
  final AccountSchemeType? accountSchemeType;
  final String? schemeValue;

  const RecipientDetails(
    this.mobileNumber,
    this.accountSchemeType,
    this.schemeValue,
  );

  RecipientDetails copyWith({
    String? mobileNumber,
    AccountSchemeType? accountSchemeType,
    String? schemeValue,
  }) {
    return RecipientDetails(
      mobileNumber ?? this.mobileNumber,
      accountSchemeType ?? this.accountSchemeType,
      schemeValue ?? this.schemeValue,
    );
  }

  factory RecipientDetails.fromJson(Map<String, dynamic> json) =>
      RecipientDetails(
        json['mobileNumber'],
        json['schemeType'] != null
            ? AccountSchemeType.fromString(json['schemeType'])
            : null,
        json['schemeValue'],
      );

  Map<String, dynamic> toJson(RecipientDetails recipientDetails) {
    return {
      'mobileNumber': recipientDetails.mobileNumber,
      'schemeType': recipientDetails.accountSchemeType.toString(),
      'schemeValue': recipientDetails.schemeValue,
    };
  }

  @override
  List<Object?> get props => [
        mobileNumber,
        accountSchemeType,
        schemeValue,
      ];
}
