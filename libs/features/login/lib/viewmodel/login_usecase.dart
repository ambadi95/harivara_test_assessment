import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';
import '../login_module.dart';
import '../service/login_service.dart';
import 'package:shared_data_models/welcome/signin/request/sign_in_request.dart';
import 'login_viewmodel.dart';

class LoginUseCase extends BaseDataProvider {
  final LoginViewModel _loginViewModel;
  LoginUseCase(this._loginViewModel, TaskManager taskManager)
      : super(taskManager);

  bool isValidMobileNumber(String mobileNumber) {
    return _loginViewModel.isValidMobileNumber(mobileNumber);
  }

  bool isValidAgentId(String agentId) {
    return _loginViewModel.isValidAgentId(agentId);
  }

  Future<CustomerSignInResponse?> login(String mobileNumber, String passcode,
      Function(String) onErrorCallback) async {
    print(mobileNumber);
    SignInRequest signInRequest =
        SignInRequest(mobileNumber: mobileNumber, passcode: passcode);
    return await executeApiRequest<CustomerSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: signInRequest.toJson(),
        serviceIdentifier: ILoginService.loginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return CustomerSignInResponse.fromJson(data);
        });
  }
}
