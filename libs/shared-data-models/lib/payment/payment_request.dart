class PaymentRequest {
  final String? customerPhNo;
  final String? merchantPhNo;
  final String? amount;
  final String? currency;
  final String? desc;
  final String? language;
  final String? passcode;

  const PaymentRequest(
    this.customerPhNo,
    this.amount,
    this.merchantPhNo,
    this.currency,
    this.desc,
    this.language,
    this.passcode,
  );

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
        json['customerPhNo'],
        json['amount'],
        json['merchantPhNo'],
        json['currency'],
        json['desc'],
        json['language'],
        json['passcode'],
      );
}
