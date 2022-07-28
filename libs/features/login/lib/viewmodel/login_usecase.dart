
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'login_viewmodel.dart';

class LoginUseCase extends BaseDataProvider {
  final LoginViewModel _loginViewModel;
  LoginUseCase(this._loginViewModel,TaskManager taskManager) : super(taskManager);

  bool isValidMobileNumber(String mobileNumber){
    return _loginViewModel.isValidMobileNumber(mobileNumber);
  }

  bool isValidAgentId(String agentId){
    return _loginViewModel.isValidAgentId(agentId);
  }
}