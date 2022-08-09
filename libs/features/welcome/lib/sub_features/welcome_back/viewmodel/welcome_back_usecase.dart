import 'package:login/login_module.dart';
import 'package:login/service/login_service.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:shared_data_models/agent_onboard/signin/request/agent_sign_in.dart';
import 'package:shared_data_models/agent_onboard/signin/response/agent_sign_in_response.dart';
import 'package:shared_data_models/welcome/signin/request/sign_in_request.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/welcome_back/service/welcome_back_service.dart';
import 'package:welcome/welcome_module.dart';

import '../../agent_details/service/agent_details_service.dart';
import 'welcome_back_view_model.dart';

class WelcomeBackUseCase extends BaseDataProvider {
  final WelcomeBackViewModel _welcomeBackViewModel;
  WelcomeBackUseCase(this._welcomeBackViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<void> saveLocale(String currentLocale) async {
    await setValueToStorage({'current_locale': currentLocale});
  }

  Future<String> getLocale() async {
    String defaultLocale = 'en';
    String savedLocale =
        await getValueFromStorage('current_locale', defaultValue: '');
    if (savedLocale.isEmpty) {
      savedLocale = defaultLocale;
    }
    return savedLocale;
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<void> saveAgentMobileNumber(String agentMobileNumber) async {
    await setValueToSecureStorage({'agentMobileNumber': agentMobileNumber});
  }

  Future<String> getAgentMobileNumber() async {
    return await getValueFromSecureStorage('agentMobileNumber', defaultValue: '');
  }

  Future<String> getCustomerName() async {
    return await getValueFromSecureStorage('CustomerName', defaultValue: '');
  }

  Future<String> getCustomerY9Id() async {
    return await getValueFromSecureStorage('CustomerY9Id', defaultValue: '');
  }

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<AgentDetailsResponse?> getAgentDetail(
      Function(String) onErrorCallback) async {
    String agentId = await getAgentId();
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"agentId": agentId},
        serviceIdentifier: IAgentDetailsService.detailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }

  Future<CustomerSignInResponse?> login(String mobileNumber, String passcode,
      Function(String) onErrorCallback) async {
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

  Future<AgentSignInResponse?> loginAgent(String passcode,
    Function(String) onErrorCallback) async {
    String agentMobileNumber = await getAgentMobileNumber();
    String agentID = await getAgentId();
    AgentSignIn getAgentRequest = AgentSignIn(
        mobileNumber: agentMobileNumber,
        y9AgentId: agentID,
      passcode: passcode
    );
    return await executeApiRequest<AgentSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: getAgentRequest.toJson(),
        serviceIdentifier: IWelcomeBackService.agentLoginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          AgentSignInResponse agentSignInResponse =
          AgentSignInResponse.fromJson(data);
          print(agentSignInResponse);
          return AgentSignInResponse.fromJson(data);
        });
  }
}
