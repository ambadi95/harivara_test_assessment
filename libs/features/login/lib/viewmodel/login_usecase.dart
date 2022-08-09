import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';
import '../login_module.dart';
import '../service/login_service.dart';
import 'package:shared_data_models/welcome/signin/request/sign_in_request.dart';
import 'login_viewmodel.dart';
import 'package:shared_data_models/agent_onboard/agent_detail_mob_nida/response/get_agent_response/get_agent_response.dart';
import 'package:shared_data_models/agent_onboard/agent_detail_mob_nida/request/get_agent_request.dart';

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

  Future<void> saveAgentId(String? agentId) async {
    return await setValueToSecureStorage({'agentId': agentId});
  }

  Future<void> saveMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'agentMobileNumber': mobileNumber});
  }

  Future<void> saveAgentName(String agentName) async {
    return await setValueToSecureStorage({'agentName': agentName});
  }

  Future<void> saveOnBordStatus(String id) async {
    return await setValueToSecureStorage({'OnBoardStatus': id});
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
            saveOnBordStatus(customerSignInResponse.data!.id.toString());
          }
          return CustomerSignInResponse.fromJson(data);
        });
  }


  Future<AgentDetailsResponse?> getAgentDetail( String agentId,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: {"agentId": agentId},
        serviceIdentifier: ILoginService.agentDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }

  // Future<GetAgentResponse?> loginAgent(String mobileNumber, String nidaNumber,
  //     String agentID, Function(String) onErrorCallback) async {
  //   // CrayonPaymentLogger.logInfo(
  //   //     mobileNumber.replaceAll("+255", "").replaceAll(" ", ""));
  //   GetAgentRequest getAgentRequest = GetAgentRequest(
  //     nidaNo: nidaNumber.replaceAll("-", ""),
  //     y9AgentId: agentID
  //   );
  //   return await executeApiRequest<GetAgentResponse?>(
  //       taskType: TaskType.DATA_OPERATION,
  //       taskSubType: TaskSubType.REST,
  //       moduleIdentifier: LoginModule.moduleIdentifier,
  //       requestData: getAgentRequest.toMap(),
  //       serviceIdentifier: ILoginService.loginIdentifier,
  //       onError: onErrorCallback,
  //       modelBuilderCallback: (responseData) {
  //         final data = responseData;
  //         GetAgentResponse agentSignInResponse =
  //         GetAgentResponse.fromMap(data);
  //         print(agentSignInResponse);
  //         // if(customerSignInResponse.data != null){
  //         //   _authManager.storeTokenInformation(customerSignInResponse.data!.token!, '', '', '');
  //         //   saveCustomerId(customerSignInResponse.data!.id);
  //         //   saveMobileNumber(mobileNumber.replaceAll(" ", ""));
  //         // }
  //         return GetAgentResponse.fromMap(data);
  //       });
  // }
}
