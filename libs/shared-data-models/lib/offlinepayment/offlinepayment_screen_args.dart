import 'package:shared_data_models/downpayment/downpayment_data_model.dart';

class OfflinePaymentScreenArgs {
  final int deviceId;
  final String amount;
  final String title;
  final String subTitle;
  final num paymentReceivedOffline;
  final num loanApproved;

  OfflinePaymentScreenArgs(
    this.deviceId,
    this.amount,
    this.title,
    this.subTitle,
    this.paymentReceivedOffline,
    this.loanApproved,
  );
}
