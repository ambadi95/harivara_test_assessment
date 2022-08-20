import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/downpayment/downpayment_data_model.dart';

class DownPaymentScreenArgs {
  final String image;
  final String title;
  final String subTitle;
  final String destinationPath;
  final List<DownPaymentDataModel> downPaymentModelList;

  DownPaymentScreenArgs(
    this.image,
    this.title,
    this.subTitle,
    this.destinationPath,
    this.downPaymentModelList,
  );
}
