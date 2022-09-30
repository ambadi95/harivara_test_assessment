import 'package:shared_data_models/downpayment/downpayment_data_model.dart';

class DownPaymentScreenArgs {
  final int deviceId;
  final String amount;
  final String title;
  final String subTitle;
  final String modelName;
  final num paymentRequested;
  final num waitForPayment;
  final num paymentReceived;
  final num loanApproved;
  final num loanActivated;
  final bool isOutOfStock;
  final bool isBottomSheetShown;

  DownPaymentScreenArgs(
    this.deviceId,
    this.amount,
    this.title,
    this.subTitle,
    this.modelName,
    this.paymentRequested,
    this.waitForPayment,
    this.paymentReceived,
    this.loanApproved,
    this.loanActivated,
      this.isOutOfStock,
      this.isBottomSheetShown
  );
}
