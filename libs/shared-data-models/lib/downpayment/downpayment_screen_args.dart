import 'package:shared_data_models/downpayment/downpayment_data_model.dart';

class DownPaymentScreenArgs {
  final int deviceId;
  final String image;
  final String title;
  final String subTitle;
  final String destinationPath;
  final List<DownPaymentDataModel> downPaymentModelList;

  DownPaymentScreenArgs(
    this.deviceId,
    this.image,
    this.title,
    this.subTitle,
    this.destinationPath,
    this.downPaymentModelList,
  );
}
