
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';

class SignupUseCase extends BaseDataProvider{
  final SignupViewModel _signupViewModel;
  SignupUseCase(this._signupViewModel,TaskManager taskManager) : super(taskManager);

}