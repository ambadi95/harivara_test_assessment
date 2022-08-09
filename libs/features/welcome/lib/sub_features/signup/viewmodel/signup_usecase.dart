import 'package:core/mobile_core.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/agent_onboard/signup/response/agent_sign_up_response.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';

import '../../../welcome_module.dart';
import '../service/signup_service.dart';

class SignupUseCase extends BaseDataProvider {
  final SignupViewModel _signupViewModel;
  final IAuthManager _authManager;

  SignupUseCase(
      this._signupViewModel, this._authManager, TaskManager taskManager)
      : super(taskManager);

  bool isValidNINDAnumber(String nidaNumber) {
    return _signupViewModel.isValidNidaNumber(nidaNumber);
  }

  bool isValidMobileNumber(String mobileNumber) {
    return _signupViewModel.isValidMobileNumber(mobileNumber);
  }

  bool isValidAgentId(String agentId) {
    return agentId.isNotEmptyOrNull;
  }

  Future<void> saveDetails(String nidaNumber, String mobileNumber) async {
    await _saveNIDANumber(nidaNumber);
    await _saveMobileNumber(mobileNumber);
  }

  Future<void> saveAgentDetails(String nidaNumber, String agentId) async {
    await _saveNIDANumber(nidaNumber);
    await saveAgentId(agentId);
  }

  Future<void> _saveNIDANumber(String nidaNumber) async {
    return await setValueToStorage({'nidaNumber': nidaNumber});
  }

  Future<void> saveCustomerId(String? customerId) async {
    return await setValueToSecureStorage({'customerId': customerId});
  }

  Future<void> saveAgentId(String? agentId) async {
    return await setValueToSecureStorage({'agentId': agentId});
  }

  Future<void> _saveMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'mobileNumber': mobileNumber});
  }

  Future<void> _saveAgentName(String mobileNumber) async {
    return await setValueToSecureStorage({'AgentName': mobileNumber});
  }



  Future<CustomerDetailResponse?> signUp(String nindaNumber, String phoneNo,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "nindaNumber": nindaNumber,
          "phoneNo": phoneNo.replaceAll(" ", "")
        },
        serviceIdentifier: ISignupService.signupIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          CustomerDetailResponse detailResponse =
              CustomerDetailResponse.fromJson(data);
          _authManager.setUserDetail(
              authInfo: detailResponse.data?.customerId.toString(),
              key: 'Customer_ID');
          return detailResponse;
        });
  }

  Future<AgentSignUpResponse?> signUpAgent(String nindaNumber, String agentId,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<AgentSignUpResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "nidaNumber": nindaNumber.replaceAll("-", ""),
          "agentId": agentId
        },
        serviceIdentifier: ISignupService.signUpAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          AgentSignUpResponse agentSignUpResponse =
              AgentSignUpResponse.fromJson(data);

          print(data);
          return agentSignUpResponse;
        });
  }

  Future<AgentSignUpResponse?> signUpCustomerByAgent(
      {required String nindaNumber,
      required String agentId,
      required String customerMobile,
      required Function(String) onErrorCallback}) async {
    String? token = await _authManager.getAccessToken();

    return await executeApiRequest<AgentSignUpResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "nidaNumber": nindaNumber.replaceAll("-", ""),
          "agentId": agentId,
          'phoneNo' : customerMobile.replaceAll(" ", ""),
          'token' : token
        },
        serviceIdentifier: ISignupService.signUpAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          AgentSignUpResponse agentSignUpResponse =
              AgentSignUpResponse.fromJson(data);

          print(data);
          return agentSignUpResponse;
        });
  }
}
