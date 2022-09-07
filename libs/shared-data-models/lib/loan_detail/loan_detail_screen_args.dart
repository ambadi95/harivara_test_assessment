import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/loan_detail/response/loan_detail_response/loan_detail_response.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

class LoanDetailArgs {
  final LoanDetailResponse loanDetailResponse;

  LoanDetailArgs(
    /*this.kycFieldType,*/
    this.loanDetailResponse,

    /*this.kycDataModelList,*/
  );
}
