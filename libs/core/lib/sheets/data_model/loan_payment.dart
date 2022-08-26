class LoanPaymentMethod {
  final String name;
  final String amount;
  bool isSelected;

  LoanPaymentMethod(
      {required this.name, required this.amount, this.isSelected = false});
}
