
import 'loan_payment.dart';

class LoanRepayment {
  final String imageUrl;
  final void Function() onPressedCustomAmount;
  final void Function() onPressedPayNow;
  final String label1;
  final String label2;
  final String label3;
  final String loanId;
  final List<LoanPaymentMethod> loanPaymentList;
  final String infoMessage;

  LoanRepayment({
    required this.imageUrl,
    required this.onPressedCustomAmount,
    required this.onPressedPayNow,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.loanId,
    required this.loanPaymentList,
    required this.infoMessage,
  });
}

enum LoanType { DeviceLoan }

enum PaymentType { PayDueAmount, DailyRepayment, TotalLoanAmount, PayCustomAmount }




