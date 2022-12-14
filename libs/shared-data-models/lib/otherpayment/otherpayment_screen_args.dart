
class OtherPaymentScreenArgs {
  final int deviceId;
  final String modelName;
  final String amount;
  final String title;
  final String subTitle;
  final num paymentReceivedOffline;
  final num loanApproved;
  final String image;
  final bool isOutOfStock;
  final bool bottomSheetShown;

  OtherPaymentScreenArgs(
      this.deviceId,
      this.modelName,
      this.amount,
      this.title,
      this.subTitle,
      this.paymentReceivedOffline,
      this.loanApproved,
      this.image,
      this.isOutOfStock,
      this.bottomSheetShown
      );
}

