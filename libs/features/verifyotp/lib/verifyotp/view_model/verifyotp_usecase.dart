import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/welcome/otp/request/otp_request.dart';
import 'package:shared_data_models/welcome/otp/response/otp_response.dart';
import 'package:shared_data_models/welcome/otp_verification/request/otp_verification_request.dart';
import 'package:shared_data_models/welcome/otp_verification/response/otp_verification_response.dart';
import 'package:shared_data_models/workflow_status/work_flow_status_response/work_flow_status_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_viewmodel.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';
import '../../verifyotp_module.dart';
import '../service/otp_service.dart';

class VerifyOtpUseCase extends BaseDataProvider {
  final VerifyOtpViewModel _verifyOtpViewModel;

  VerifyOtpUseCase(this._verifyOtpViewModel, TaskManager taskManager)
      : super(taskManager);

  String updateCurrentOTP(
    KeypadButtonType keypadButtonType,
    String previousOtp,
    int otpLength,
  ) {
    return _verifyOtpViewModel.updateCurrentOTP(
      keypadButtonType,
      previousOtp,
      otpLength,
    );
  }

  Future<String> validateCustomerOTP(
    String customerOtp,
  ) async {
    if (!_verifyOtpViewModel.validCustomerOtp(customerOtp)) {
      return 'customerOtp-invalid-error';
    }
    return '';
  }

  Future<void> saveOnBordStatus(String id) async {
    return await setValueToSecureStorage({'OnBoardStatus': id});
  }

  Future<void> saveCustomerId(String id) async {
    return await setValueToSecureStorage({'customerId': id});
  }

  Future<void> saveMobileNumber(String mobileNumber) async {
    return await setValueToSecureStorage({'mobileNumber': mobileNumber});
  }

  Future<void> setPaymentId(String paymentId) async {
    return await setValueToSecureStorage({'paymentId': paymentId});
  }

  Future<void> setDeviceId(String deviceId) async {
    return await setValueToSecureStorage({'deviceId': deviceId});
  }

  Future<void> setClientId(String clientId) async {
    return await setValueToSecureStorage({'clientId': clientId});
  }

  Future<void> loanCalled(String loanCalled) async {
    return await setValueToSecureStorage({'loanCalled': loanCalled});
  }

  Future<String> getCustomerMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<String> getAgentCustomerId() async {
    return await getValueFromSecureStorage('y9AgentIDCus', defaultValue: '');
  }

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<void> saveNidaNumber(String nidaNumber) async {
    await setValueToStorage({'nidaNumber': nidaNumber});
  }

  Future<OtpResponse?> otpGen(String id, UserType userType, String event,
      Function(String) onErrorCallback) async {
    OtpRequest otpRequest = OtpRequest(
        id: id,
        type: (userType == UserType.Customer ? "Customer" : "Agent"),
        event: event,mobile: "");

    print(otpRequest.toJson().toString());
    return await executeApiRequest<OtpResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: otpRequest.toJson(),
        serviceIdentifier: IOtpService.otpIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return OtpResponse.fromJson(data);
        });
  }

  Future<OtpResponse?> otpGenCustomerByAgent(String id, String userType,
      String event,Function(String) onErrorCallback,[OtpScreenArgs? otpScreenArgs]) async {
    OtpRequest otpRequest = OtpRequest(id: id, type: userType, event: event,mobile: otpScreenArgs!.updateBy=="nida" ?  '+255${otpScreenArgs.phoneNumber.replaceAll(" ", "")}' : "");

    CrayonPaymentLogger.logInfo(otpRequest.toJson().toString());

    return await executeApiRequest<OtpResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: otpRequest.toJson(),
        serviceIdentifier: IOtpService.otpGenCustomerByAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          final data = responseData;
          return OtpResponse.fromJson(data);
        });
  }

  Future<OtpVerificationResponse?> otpVerify(String id, String otp,
      UserType userType, String event, Function(String) onErrorCallback) async {
    OtpVerificationRequest otpRequest = OtpVerificationRequest(
        id: id,
        type: userType == UserType.Customer ? "Customer" : "Agent",
        otp: otp,
        event: event);
    return await executeApiRequest<OtpVerificationResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: otpRequest.toJson(),
        serviceIdentifier: IOtpService.otpVerifyIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return OtpVerificationResponse.fromJson(data);
        });
  }

  Future<OtpVerificationResponse?> otpVerifyCustomerByAgent(String id,
      String otp, String userType, Function(String) onErrorCallback) async {
    OtpVerificationRequest otpRequest = OtpVerificationRequest(
        id: id,
        type: userType,
        otp: otp,
        event: OTPEvent.Customer_Registration.toShortString());
    CrayonPaymentLogger.logInfo(otpRequest.toJson().toString());

    return await executeApiRequest<OtpVerificationResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: otpRequest.toJson(),
        serviceIdentifier: IOtpService.otpVerifyCustomerByAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          final data = responseData;
          return OtpVerificationResponse.fromJson(data);
        });
  }

  Future<CustomerDetailResponse?> updateCustomerDetailsOnBoarding(
      String nidaNumber,
      String mobileNumber,
      String updateBy,
      Function(String) onErrorCallback) async {
    CrayonPaymentLogger.logInfo("onboarding/validation");

    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: {
          "mobileNo": "+255${mobileNumber.replaceAll(" ", "")}",
          "nidaNo": nidaNumber.replaceAll("-", ""),
          "updateBy": updateBy
        },
        serviceIdentifier: IOtpService.updateCustomerDetailsIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          return CustomerDetailResponse.fromJson(responseData);
        });
  }

  Future<WorkFlowStatusResponse?> workFlowCustomerByAgent(
      String id, Function(String) onErrorCallback) async {
    return await executeApiRequest<WorkFlowStatusResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: {"customerId": id},
        serviceIdentifier: IOtpService.workFlowCustomerByAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          final data = responseData;
          return WorkFlowStatusResponse.fromJson(data);
        });
  }

  Future<GetCustomerDetailsResponse?> getCustomerDetailsByMobileNumber(
      Function(String) onErrorCallback) async {
    String mobile = await getCustomerMobileNumber();
    CrayonPaymentLogger.logInfo("I am in Customer Detail API $mobile");
    return await executeApiRequest<GetCustomerDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: {"mobileNumber": mobile},
        serviceIdentifier: IOtpService.customerDetailsIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          GetCustomerDetailsResponse detailResponse =
              GetCustomerDetailsResponse.fromJson(data);
          return detailResponse;
        });
  }
}
