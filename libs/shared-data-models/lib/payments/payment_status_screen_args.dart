class PaymentsStatusScreenArgs {
  final String image;
  final String mobileNumber;
  final String amount;
  final String paymentId;

  PaymentsStatusScreenArgs({
    this.image= "",
    required this.mobileNumber,
    required this.amount,
    required this.paymentId,
  }
  );
}
