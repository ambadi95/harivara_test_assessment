import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

class KycScreenArgs {
  final KycFieldType kycFieldType;
  final String image;
  final String title;
  final String subTitle;
  final String destinationPath;
  final List<KYCDataModel> kycDataModelList;
  final bool kycCheckSuccess;

  KycScreenArgs(
    this.kycFieldType,
    this.image,
    this.title,
    this.subTitle,
    this.destinationPath,
    this.kycDataModelList,
      this.kycCheckSuccess
  );
}
