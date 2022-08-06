import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
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
  final IAuthManager _authManager;
  LoginUseCase(this._loginViewModel, this._authManager, TaskManager taskManager)
      : super(taskManager);

  bool isValidMobileNumber(String mobileNumber) {
    return _loginViewModel.isValidMobileNumber(mobileNumber);
  }

  bool isValidAgentId(String agentId) {
    return _loginViewModel.isValidAgentId(agentId);
  }

  Future<void> saveCustomerId(String? customerId) async {
    return await setValueToSecureStorage({'customerId': customerId});
  }


  Future<void> saveMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'mobileNumber': mobileNumber});
  }

  Future<CustomerSignInResponse?> login(String mobileNumber, String passcode,
      Function(String) onErrorCallback) async {
    CrayonPaymentLogger.logInfo(
        mobileNumber.replaceAll("+255", "").replaceAll(" ", ""));
    SignInRequest signInRequest = SignInRequest(
        mobileNumber: mobileNumber.replaceAll(" ", ""), passcode: passcode);
    return await executeApiRequest<CustomerSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: signInRequest.toJson(),
        serviceIdentifier: ILoginService.loginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          print(data);
          CustomerSignInResponse customerSignInResponse = CustomerSignInResponse.fromJson(data);
          print(customerSignInResponse);
          if(customerSignInResponse.data != null){
            _authManager.storeTokenInformation(customerSignInResponse.data!.token!, '', '', '');
            saveCustomerId(customerSignInResponse.data!.id);
            saveMobileNumber(mobileNumber.replaceAll(" ", ""));
          }
          return CustomerSignInResponse.fromJson(data);
        });
  }
}
