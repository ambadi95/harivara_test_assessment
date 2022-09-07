import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'loan_detail_viewmodel.dart';

class LoanDetailUseCase extends BaseDataProvider {
  final LoanDetailViewModel _loanDetailViewModel;

  LoanDetailUseCase(this._loanDetailViewModel, TaskManager taskManager)
      : super(taskManager);
}
