import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/agent_onboard/signin/request/agent_sign_in.dart';
import 'package:shared_data_models/agent_onboard/signin/response/agent_sign_in_response.dart';
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
          CustomerSignInResponse customerSignInResponse =
              CustomerSignInResponse.fromJson(data);
          print(customerSignInResponse);
          if (customerSignInResponse.data != null) {
            _authManager.storeTokenInformation(
                customerSignInResponse.data!.token!, '', '', '');
            saveCustomerId(customerSignInResponse.data!.id);
            saveMobileNumber(mobileNumber.replaceAll(" ", ""));
          }
          return CustomerSignInResponse.fromJson(data);
        });
  }

  Future<AgentSignInResponse?> loginAgent(String mobileNumber, String passcode,
      String agentID, Function(String) onErrorCallback) async {
    // CrayonPaymentLogger.logInfo(
    //     mobileNumber.replaceAll("+255", "").replaceAll(" ", ""));
    AgentSignIn agentSignIn = AgentSignIn(
        mobileNumber: mobileNumber, passcode: passcode, y9AgentId: agentID);
    return await executeApiRequest<AgentSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: agentSignIn.toJson(),
        serviceIdentifier: ILoginService.loginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          print(data);
          AgentSignInResponse agentSignInResponse =
              AgentSignInResponse.fromJson(data);
          print(agentSignInResponse);
          // if(customerSignInResponse.data != null){
          //   _authManager.storeTokenInformation(customerSignInResponse.data!.token!, '', '', '');
          //   saveCustomerId(customerSignInResponse.data!.id);
          //   saveMobileNumber(mobileNumber.replaceAll(" ", ""));
          // }
          return AgentSignInResponse.fromJson(data);
        });
  }
}
