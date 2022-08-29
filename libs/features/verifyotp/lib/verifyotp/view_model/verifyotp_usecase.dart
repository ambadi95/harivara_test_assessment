import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
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

  Future<OtpResponse?> otpGen(
      String id, UserType userType, Function(String) onErrorCallback) async {
    OtpRequest otpRequest = OtpRequest(
        id: id, type: (userType == UserType.Customer ? "Customer" : "Agent"));

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

  Future<OtpResponse?> otpGenCustomerByAgent(
      String id, String userType, Function(String) onErrorCallback) async {
    OtpRequest otpRequest = OtpRequest(id: id, type: userType);

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
      UserType userType, Function(String) onErrorCallback) async {
    OtpVerificationRequest otpRequest = OtpVerificationRequest(
        id: id,
        type: userType == UserType.Customer ? "Customer" : "Agent",
        otp: otp);
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
    OtpVerificationRequest otpRequest =
        OtpVerificationRequest(id: id, type: userType, otp: otp);
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

  Future<WorkFlowStatusResponse?> workFlowCustomerByAgent(
      String id, Function(String) onErrorCallback) async {
    return await executeApiRequest<WorkFlowStatusResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: VerifyOtpModule.moduleIdentifier,
        requestData: { "customerId" : id },
        serviceIdentifier: IOtpService.workFlowCustomerByAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CrayonPaymentLogger.logInfo(responseData.toString());
          final data = responseData;
          return WorkFlowStatusResponse.fromJson(data);
        });
  }
}
