import 'package:equatable/equatable.dart';

class Amount extends Equatable {
  final double amount;
  final String currency;

  Amount(
    this.amount,
    this.currency,
  );

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        double.tryParse(json['amount'].toString()) ?? 0.00,
        json['currency'],
      );

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.toStringAsFixed(2),
      'currency': currency,
    };
  }

  @override
  List<Object?> get props => [amount, currency];
}
