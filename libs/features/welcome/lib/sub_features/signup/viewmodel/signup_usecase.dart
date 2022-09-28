import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/model/response/jwt/jwt_token_response.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:shared_data_models/agent_onboard/signup/response/agent_sign_up_response.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';
import 'package:shared_data_models/customer_onboard/payment_mode_list_respose/payment_mode_list_response/payment_mode_list_response.dart';
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

  bool isValidPaymentMode(String paymentMode) {
    return paymentMode.isNotEmptyOrNull;
  }

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<String> getAgentType() async {
    return await getValueFromSecureStorage('agentType', defaultValue: '');
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

  Future<void> saveTelcoPartner(String telco) async {

    return await setValueToStorage({'telcoPartner': telco});
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

  Future<void> _saveCustomerName(String mobileNumber) async {
    return await setValueToSecureStorage({'CustomerName': mobileNumber});
  }

  Future<CustomerDetailResponse?> signUp(String nindaNumber, String phoneNo,
      Function(String) onErrorCallback) async {
    CrayonPaymentLogger.logInfo(phoneNo.replaceAll(" ", ""));
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

  Future<JwtTokenResponse?> callJWTToken(
      Function(String) onErrorCallback) async {
    await executeApiRequest<JwtTokenResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          'username': 'y9dev',
          'password': 'P@ssw0rd',
          'clientid': '7dcd46ae-5f2f-4b14-a9a2-c48796180517'
        },
        serviceIdentifier: ISignupService.jwtIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;

          JwtTokenResponse jwtTokenResponse = JwtTokenResponse.fromJson(data);

          if (jwtTokenResponse.status == true) {
            _authManager.storeJWTToken(
              jwtTokenResponse.data!.jwttoken!,
            );
          }
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

  Future<CustomerDetailResponse?> signUpCustomerByAgent(
      {required String nindaNumber,
      required String agentId,
      required String customerMobile,
      required Function(String) onErrorCallback}) async {
    String? token = await _authManager.getAccessToken();

    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "nidaNumber": nindaNumber.replaceAll("-", ""),
          "agentId": agentId,
          'mobileNo': customerMobile.replaceAll(" ", ""),
          'token': token
        },
        serviceIdentifier: ISignupService.signUpCustomerByAgent,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          final data = responseData;
          CustomerDetailResponse agentSignUpResponse =
              CustomerDetailResponse.fromJson(data);
          _authManager.setUserDetail(
              authInfo: agentSignUpResponse.data?.customerId.toString(),
              key: 'Customer_ID');
           _saveMobileNumber(customerMobile.replaceAll(" ", ""));
          print(data);
          return agentSignUpResponse;
        });
  }

  Future<CustomerDetailResponse?> getCustomerDetails(String nindaNumber, String phoneNo,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "nidaNo": nindaNumber.replaceAll("-", ""),
          "mobileNo": phoneNo.replaceAll(" ", "")
        },
        serviceIdentifier: ISignupService.getCustomerDetailByNidaMobileAndIdentifier,
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

  Future<GetCustomerDetailsResponse?> getCustomerDetailsByMobileNumber( String phoneNo,
      Function(String) onErrorCallback) async {

    return await executeApiRequest<GetCustomerDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "mobileNo": phoneNo.replaceAll(" ", "")
        },
        serviceIdentifier: ISignupService.getCustomerDetailByMobileNumberIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          GetCustomerDetailsResponse detailResponse =
          GetCustomerDetailsResponse.fromJson(data);
          _authManager.setUserDetail(
              authInfo: detailResponse.data?.customerId.toString(),
              key: 'Customer_ID');
          return detailResponse;
        });
  }

  Future<AgentDetailsResponse?> getAgentDetail(String agentId,
      String nidaNumber, Function(String) onErrorCallback) async {
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"agentId": agentId, "nidaNumber": nidaNumber},
        serviceIdentifier: ISignupService.agentDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }

  Future<PaymentModeListResponse?> getPaymentMode(Function(String) onErrorCallback) async {
    return await executeApiRequest<PaymentModeListResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {},
        serviceIdentifier: ISignupService.getTelcoListIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return PaymentModeListResponse.fromMap(data);
        });
  }
}
