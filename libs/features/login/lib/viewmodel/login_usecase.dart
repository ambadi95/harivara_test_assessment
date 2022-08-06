import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/welcome/signin/response/data.dart';
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
          CustomerSignInResponse customerSignInResponse =
              CustomerSignInResponse.fromJson(data);

          CrayonPaymentLogger.logInfo(customerSignInResponse.toString());
          Data? customerData = Data();
          customerData = customerSignInResponse.data;
          if (customerSignInResponse.status!) {
            _authManager.storeTokenInformation(
                customerData!.token!, '', '', '');
            _authManager.setUserDetail(
                key: 'Customer_ID', authInfo: customerSignInResponse.data?.id);
          }
          return CustomerSignInResponse.fromJson(data);
        });
  }
}
