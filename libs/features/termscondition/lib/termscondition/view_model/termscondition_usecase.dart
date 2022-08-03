import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:termscondition/termscondition/view_model/termsconditon_viewmodel.dart';

class TermsConditionUseCase extends BaseDataProvider{
  final TermsConditionViewModel _termsconditionViewModel;
  TermsConditionUseCase(this._termsconditionViewModel, TaskManager taskManager): super(taskManager);

}