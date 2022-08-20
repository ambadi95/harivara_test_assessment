
import 'package:kyc_credit/kyccredit/view_model/kyccredit_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

class KycCreditUseCase extends BaseDataProvider {
  final KycCreditViewModel _kycCreditViewModel;
  KycCreditUseCase(this._kycCreditViewModel, TaskManager taskManager)
      : super(taskManager);
}
