import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/model/response/jwt/jwt_token_response.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:shared_data_models/check_passcode_response/check_passcode_response.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
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

  Future<void> saveAgentId(String? agentId) async {
    return await setValueToSecureStorage({'agentId': agentId});
  }

  Future<void> saveCustomerMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'mobileNumber': mobileNumber});
  }

  Future<void> saveMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'agentMobileNumber': mobileNumber});
  }

  Future<void> saveCustomerName(String customerName) async {
    return await setValueToSecureStorage({'CustomerName': customerName});
  }

  Future<void> saveAgentName(String agentName) async {
    return await setValueToSecureStorage({'agentName': agentName});
  }

  Future<void> saveOnBordStatus(String id) async {
    return await setValueToSecureStorage({'OnBoardStatus': id});
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
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
          if (customerSignInResponse.data != null) {
            _authManager.storeTokenInformation(
                customerSignInResponse.data!.token!, '', '', '');
            saveCustomerId(customerSignInResponse.data!.id);
            saveCustomerMobileNumber(mobileNumber.replaceAll(" ", ""));
            saveCustomerName(customerSignInResponse.data!.username!);
            saveOnBordStatus(customerSignInResponse.data!.id.toString());
          }
          return CustomerSignInResponse.fromJson(data);
        });
  }

  Future<JwtTokenResponse?> callJWTToken(
      Function(String) onErrorCallback) async {
    return await executeApiRequest<JwtTokenResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: {
          'username': 'y9dev',
          'password': 'P@ssw0rd',
          'clientid': '7dcd46ae-5f2f-4b14-a9a2-c48796180517'
        },
        serviceIdentifier: ILoginService.jwtIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;

          JwtTokenResponse jwtTokenResponse ;
          try {
            jwtTokenResponse = JwtTokenResponse.fromJson(data);
            if (jwtTokenResponse.status == true) {
              _authManager.storeJWTToken(
                jwtTokenResponse.data!.jwttoken!,
              );
            }
          }catch(e){
            jwtTokenResponse = JwtTokenResponse(status: false,data: JwtTokenResponseData(jwttoken: ""));
          }

          return jwtTokenResponse;
        });
  }

  Future<AgentDetailsResponse?> getAgentDetail(String agentId,
      String mobileNumber, Function(String) onErrorCallback) async {
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: {"agentId": agentId, 'mobileNumber': mobileNumber},
        serviceIdentifier: ILoginService.agentDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }

  Future<CheckPasscodeResponse?> getPasscodeCheck(
      String mobileNumber, Function(String) onErrorCallback) async {
    return await executeApiRequest<CheckPasscodeResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: {'mobileNumber': mobileNumber},
        serviceIdentifier: ILoginService.checkPasscodeIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          saveCustomerMobileNumber(mobileNumber.replaceAll(" ", ""));
          return CheckPasscodeResponse.fromJson(data);

        });
  }

  Future<GetCustomerDetailsResponse?> getCustomerDetailsByMobileNumber(
      String phoneNo, Function(String) onErrorCallback) async {
    CrayonPaymentLogger.logInfo("I am in Customer Detail API $phoneNo");
    return await executeApiRequest<GetCustomerDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: {"mobileNumber": phoneNo},
        serviceIdentifier: ILoginService.customerDetailsIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          GetCustomerDetailsResponse detailResponse =
              GetCustomerDetailsResponse.fromJson(data);
                    saveCustomerId(detailResponse.data?.customerId.toString());
          _authManager.setUserDetail(
              authInfo: detailResponse.data?.customerId.toString(),
              key: 'Customer_ID');
          return detailResponse;
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
