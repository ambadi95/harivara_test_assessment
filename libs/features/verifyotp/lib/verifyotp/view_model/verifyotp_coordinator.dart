import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/customer_onboard/Customer_onboarding_status/customer_onboarding_status.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/workflow_status/work_flow_status_response/work_flow_status_response.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:verifyotp/navigation_handler/verifyotp_navigation_handler.dart';
import 'package:verifyotp/verifyotp/state/verify_otp_state.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_usecase.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/utils/app_utils.dart';

class VerifyOtpCoordinator extends BaseViewModel<VerifyOtpState> {
  final VerifyOtpNavigationHandler _navigationHandler;
  final VerifyOtpUseCase _verifyOtpUseCase;
  TextEditingController otpController = TextEditingController();

  VerifyOtpCoordinator(this._navigationHandler, this._verifyOtpUseCase)
      : super(const VerifyOtpState.initialState());

  void initialiseState(
    BuildContext context,
    String pageTitle,
    String pageDescription,
    String destinationPath,
    OtpVerificationType otpVerificationType,
    String initialPasscode,
  ) async {
    state = VerifyOtpState.ready(
      context: context,
      initialPasscode: initialPasscode,
      currentPasscode: '',
      pageDescription: pageDescription,
      destinationPath: destinationPath,
      pageTitle: pageTitle,
      passcodeLength: 6,
      otpVerificationType: otpVerificationType,
      attemptsRemain: 3,
      attemptsRemainFlag: false,
      isLoading: false,
    );
  }

  String otp = '';

  Future<void> generateOtp(String id, UserType userType,
      OtpVerificationType otpVerificationType, String event) async {
    try {
      var response;
      if (otpVerificationType == OtpVerificationType.customerSignUpAgent) {
        response = await _verifyOtpUseCase.otpGenCustomerByAgent(
            id, 'Customer', event, (p0) => null);
      } else {
        response =
            await _verifyOtpUseCase.otpGen(id, userType, event, (p0) => null);
      }
      if (response?.status == true) {
        int otp1 = response?.data?.token as int;
        otp = otp1.toString();
        //otpController.text = otp;
        CrayonPaymentLogger.logInfo(otp);
      } else {
        _showAlertForErrorMessage(response.message);
      }
    } catch (e) {
      print(e.toString());
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }

  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

  Future<void> verifyOTP(
    BuildContext context,
    OtpVerificationType otpVerificationType,
    String? refId,
    String otp,
    String destination,
    int attemptRemaining,
    int verifyAttempt,
    Future<void> Function()? onPasscodeVerifiedCallback, {
    String? mobileNum,
    isResetPasscode = false,
  }) async {
    if (otpVerificationType == OtpVerificationType.mobile) {
      //state = const VerifyOtpState.loadingState();
      // try {
      //   var result =
      //  await _otpVerificationUseCase.mobile(refId, otp, (p0) {
      //     state = const VerifyOtpState.successState();
      //     _handleOtpError(
      //       context,
      //       mobileNum.toString(),
      //       0,
      //       p0.subtitle,
      //     );
      //     return;
      // });
      //   if (result != null && result.verified) {
      //     onPasscodeVerifiedCallback?.call();
      //   } else {
      //     state = VerifyOtpState.errorState('Incorrect otp');
      //   }
      // } catch (e) {
      //   _handleOtpError(
      //     context,
      //     mobileNum.toString(),
      //     0,
      //     'Something went wrong',
      //   );
      // }
    }

    // on ErrorResponse catch (errorResponse) {
    //   _handleOtpError(
    //     context,
    //     mobileNum.toString(),
    //     totalAttempt,
    //     _getErrorMessage(errorResponse.subtitle),
    //   );
    // }
  }

  Future<void> onVerifyPasscode(String passCode, String userType) async {
    var currentState = state as VerifyOtpStateReady;
    switch (currentState.otpVerificationType) {
      case OtpVerificationType.mobile:
        await verifyPasscode(
          currentState.initialPasscode,
          passCode,
          currentState.destinationPath,
          userType,
        );
        break;
      case OtpVerificationType.retry:
        await verifyPasscode(
          currentState.initialPasscode,
          passCode,
          currentState.destinationPath,
          userType,
        );
        break;
    }
  }

//verfiy passcode
  Future<void> verifyPasscode(String oldPassCode, String newPasscode,
      String destinationPath, String userType) async {
    // var currentState = state as VerifyOtpStateReady;
    //
    // onVerifyPasscode(newPasscode);
    //navigateToDestinationPath(destinationPath, userType);
  }

  Future<void> navigateToDestinationPath(
      String destinationPath,
      UserType userType,
      OtpScreenArgs otpScreenArgs,
      String enterOtp,
      String event) async {
    CrayonPaymentLogger.logInfo("I am in OTP Verify");
    var currentState = state as VerifyOtpStateReady;
    try {
      int attempts = currentState.attemptsRemain;
      if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.customerSign) {
        state = currentState.copyWith(isLoading: true);

        var responseSignin = await _verifyOtpUseCase.otpVerify(
            otpScreenArgs.refId,
            enterOtp,
            otpScreenArgs.userType,
            event,
            (p0) => null);
        state = currentState.copyWith(isLoading: false);
        if (responseSignin!.status == true) {
          if (userType == UserType.Customer) {
            var customerAgentIdResponse = await _verifyOtpUseCase
                .getCustomerDetailsByMobileNumber((p0) => null);
            if (customerAgentIdResponse?.status == true) {
              String? customerAgentId =
                  customerAgentIdResponse?.data?.y9AgentId;
              if (customerAgentId != null && customerAgentId.isNotEmpty) {
                _navigationHandler.navigateToHomeScreen(userType);
              } else {
                _navigationHandler.navigateToCustomerEnrollmentScreen();
              }
            } else {
              _showAlertForErrorMessage(customerAgentIdResponse!.message!);
            }
          } else {
            _navigationHandler.navigateToHomeScreen(userType);
          }
        } else {
          _showAlertForErrorMessage(responseSignin.message!);
        }
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.customerSignUpAgent) {
        state = currentState.copyWith(isLoading: true);

        var responseSignin = await _verifyOtpUseCase.otpVerifyCustomerByAgent(
            otpScreenArgs.refId, enterOtp, 'Customer', (p0) => null);
        state = currentState.copyWith(isLoading: false);

        if (responseSignin!.data!.status == "success") {
          print('###############');
          print(otpScreenArgs.refId);
          var getWorkFlowStatus = await _verifyOtpUseCase
              .workFlowCustomerByAgent(otpScreenArgs.refId, (p0) => null);
          if (getWorkFlowStatus!.status!) {
            CrayonPaymentLogger.logInfo('I am in WorkFlow Status');
            //TODO Workflow Navigation
            navigationToWorkFlow(
                getWorkFlowStatus, getWorkFlowStatus.data!.status!);
            //_navigationHandler.navigateToDetailScreen();
          } else {
            _showAlertForErrorMessage(getWorkFlowStatus.message!);
          }
        }else{
          _showAlertForErrorMessage(responseSignin.message!);
        }
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.mobile) {
        if (userType == UserType.Customer) {
          state = currentState.copyWith(isLoading: true);
          var response = await _verifyOtpUseCase.otpVerify(otpScreenArgs.refId,
              enterOtp, otpScreenArgs.userType, event, (p0) => null);
          if (response!.data!.status == "success") {
            state = currentState.copyWith(isLoading: false);
            _navigationHandler.navigateToDestinationPath(
                destinationPath, userType);
          } else {
            otpController.text = "";
            state = currentState.copyWith(isLoading: false);
            // state =  currentState.copyWith(attemptsRemainFlag: true);
            if (attempts > 1) {
              state = currentState.copyWith(attemptsRemain: attempts - 1);
            } else {
              state = currentState.copyWith(attemptsRemain: 3);
              _showAlertForOTPAttempts();
            }
          }
        } else {
          state = currentState.copyWith(isLoading: true);
          var response = await _verifyOtpUseCase.otpVerify(otpScreenArgs.refId,
              enterOtp, otpScreenArgs.userType, event, (p0) => null);
          if (response!.status == true) {
            state = currentState.copyWith(isLoading: false);
            _navigationHandler.openForNewPasscode(userType);
          } else {
            otpController.text = "";
            state = currentState.copyWith(isLoading: false);
            // state =  currentState.copyWith(attemptsRemainFlag: true);
            if (attempts > 1) {
              state = currentState.copyWith(attemptsRemain: attempts - 1);
            } else {
              state = currentState.copyWith(attemptsRemain: 3);
              _showAlertForOTPAttempts();
            }
          }
        }
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.agentSignIn) {
        var responseSignin = await _verifyOtpUseCase.otpVerify(
            otpScreenArgs.refId,
            enterOtp,
            otpScreenArgs.userType,
            event,
            (p0) => null);
        if (responseSignin?.status == true) {
          String agentId = await _verifyOtpUseCase.getAgentId();
          await _verifyOtpUseCase.saveOnBordStatus(agentId);

          _navigationHandler.navigateToAgentWelcomeBack(userType);
        }else{
          _showAlertForErrorMessage(responseSignin!.message!);
        }
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.resetPasscodeCustomer) {
        _navigationHandler.openForUpdateNewPasscode(userType);
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.updatePasscodeAgent) {
        _navigationHandler.openForUpdateNewPasscodeAgent(userType);
      } else if (otpScreenArgs.otpVerificationType ==
          OtpVerificationType.customerPasscodeSet) {
        state = currentState.copyWith(isLoading: true);
        var response = await _verifyOtpUseCase.otpVerify(otpScreenArgs.refId,
            enterOtp, otpScreenArgs.userType, event, (p0) => null);
        if (response!.data!.status == "success") {
          state = currentState.copyWith(isLoading: false);
          _navigationHandler.openForNewPasscodeAgentCustomer(userType);
        } else {
          otpController.text = "";
          state = currentState.copyWith(isLoading: false);
          // state =  currentState.copyWith(attemptsRemainFlag: true);
          if (attempts > 1) {
            state = currentState.copyWith(attemptsRemain: attempts - 1);
          } else {
            state = currentState.copyWith(attemptsRemain: 3);
            _showAlertForOTPAttempts();
          }
        }
      }
    } catch (e) {
      state = currentState.copyWith(isLoading: false);
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: 'otp_validation_failed'.tr, //e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }

  Future<void> goBack() async {
    _navigationHandler.goBack();
  }

  otpAttempts(int attempts) {
    var currentState = state as VerifyOtpStateReady;
    otpController.text = "";
    if (attempts > 1) {
      state = currentState.copyWith(attemptsRemain: attempts - 1);
    } else {
      state = currentState.copyWith(attemptsRemain: 3);
      _showAlertForOTPAttempts();
    }
  }

//
// Future<void> _handleOtpError(
//     BuildContext context,
//     String mobileNum,
//     int attemptLeft,
//     String message,
//     ) async {
//   if (attemptLeft == 1) {
//     var response =
//     await _otpVerificationUseCase.requestBlock(mobileNum, (p0) => null);
//     state = VerifyOtpState.successState();
//     if (response != null) {
//       if (response.reasonCode == 'BLOCKED_CUSTOMER') {
//        // tooManyAttemptsLockBottomSheet(response.message.toString());
//       }
//     }
//   } else {
//     state = VerifyOtpState.errorState(message);
//   }
// }

// String _getErrorMessage(String message) {
//   switch (message) {
//     case 'User Already registered with this mobile number!':
//       return 'otp-expired';
//     case 'Invalid OTP!':
//       return 'otp-verification-screen-otp-incorrect-otp';
//     case 'OTP_EXPIRED':
//       return 'otp-expired';
//     case 'otp-attempt-remaining':
//       return 'otp-attempt-remaining';
//     default:
//       return message;
//   }
// }

  _showAlertForOTPAttempts() {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: 'VO_Incorrect_OTP_Alert_Msg'.tr,
          alertTitle: 'VO_Incorrect_OTP_Title'.tr,
          alertIcon: "assets/images/incorrect_otp.png",
          onClose: () {
            goBack();
            goBack();
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

  navigationToWorkFlow(
      WorkFlowStatusResponse workFlowStatusResponse, String status) async {
    switch (status) {
      case Initiated :
        _navigationHandler.navigateToDetailScreen();
        break;
      case Enrolled :
        _navigationHandler.navigateToDetailScreen();
        break;

      case KYCInitiated :
         _navigationHandler.navigateToKYCScreen(false);
        break;

      case MNOConsent :
        _navigationHandler.navigateToMNOConsentScreen(false);
        break;

      case KYCSuccess :
         _navigationHandler.navigateToKYCScreen(true);
       // _navigationHandler.navigateToDetailScreen();
        break;

      case KYCSuccessManuallyApproved :
       _navigationHandler.navigateToKYCScreen(true,isKycManualApprove: true);
        break;
      case KYCFailed :
        // _navigationHandler.navigateToKYCScreen(true);
        _navigationHandler.navigateToDetailScreen();
        break;

      case CreditCheckRequested :
        // _navigationHandler.navigateToKYCScreen(true);
        _navigationHandler.navigateToDetailScreen();
        break;

      case CreditCheckSuccess :
        _navigationHandler.navigateToDeviceOption(false, UserType.AgentCustomer);
        break;

      case DeviceSelection :
        _navigationHandler.navigateToDeviceOption(
            false, UserType.AgentCustomer);
        break;
      case DeviceSelected :
        _navigationHandler.navigateToDeviceOption(true, UserType.AgentCustomer);
        break;
      case DownpaymentInitiated :
        try {
          await _saveData(workFlowStatusResponse);
          _navigationHandler.navigateToDownPaymentScreen(
            deviceId: workFlowStatusResponse.data!.data[2].toString(),
            paymentStatus: 1,
            amount: workFlowStatusResponse.data!.data[3]["amountPaid"],
          );
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }

        // _navigationHandler.navigateToDownPaymentScreen();
        break;

      case DownpaymentSuccess :
        try {
          _saveData(workFlowStatusResponse);
          _navigationHandler.navigateToDownPaymentScreen(
            deviceId: workFlowStatusResponse.data!.data[2].toString(),
            paymentStatus: 0,
            paymentReceived: 1,
            amount: workFlowStatusResponse.data!.data[3]["amountPaid"],
          );
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }
        // _navigationHandler.navigateToDownPaymentScreen();
        break;

      case DownpaymentFailed :
        try {
          _saveData(workFlowStatusResponse);
          _navigationHandler.navigateToDownPaymentScreen(
            deviceId: workFlowStatusResponse.data!.data[2].toString(),
            paymentStatus: 0,
            paymentReceived: 0,
            amount: workFlowStatusResponse.data!.data[3]["amountPaid"],
          );
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }
        break;

      case LoanInitiated :
        // try {
        //   _saveData(workFlowStatusResponse);
        //   _navigationHandler.navigateToDownPaymentScreen(
        //     deviceId: workFlowStatusResponse.data!.data[2].toString(),
        //     paymentStatus: 1,
        //     amount: workFlowStatusResponse.data!.data[3]["amountPaid"],
        //   );
        //
        // } catch (e) {
        //   return _showAlertForErrorMessage(
        //       "Something went wrong,Please try again later!");
        // }
        //need to be change
        try {
          _saveData(workFlowStatusResponse);
          _navigationHandler.navigateToDownPaymentScreen(
            deviceId: workFlowStatusResponse.data!.data[2].toString(),
            paymentStatus: 0,
            paymentReceived: 1,
            loanId: workFlowStatusResponse.data!.data[3]["loanId"] ?? "",
            amount: workFlowStatusResponse.data!.data[3]["amountPaid"] ?? "",
          );
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }

        //_navigationHandler.navigateToDeviceLoanCreation();
        break;

      case LoanRejected :
        // try {
        //   _saveData(workFlowStatusResponse);
        //   _navigationHandler.navigateToDownPaymentScreen(
        //     deviceId: workFlowStatusResponse.data!.data[2].toString(),
        //     paymentStatus: 1,
        //     amount: workFlowStatusResponse.data!.data[3]["amountPaid"],
        //   );
        //
        // } catch (e) {
        //   return _showAlertForErrorMessage(
        //       "Something went wrong,Please try again later!");
        // }
        //need to be change
        try {
          _saveData(workFlowStatusResponse);
          _navigationHandler.navigateToDownPaymentScreen(
            deviceId: workFlowStatusResponse.data!.data[2].toString(),
            paymentStatus: 0,
            paymentReceived: 1,
            loanApproval:2,
            loanId: workFlowStatusResponse.data!.data[3]["loanId"] ?? "",
            amount: workFlowStatusResponse.data!.data[3]["amountPaid"] ?? "",
          );
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }

        //_navigationHandler.navigateToDeviceLoanCreation();
        break;

      case LoanApproved :
        try {
          _saveData(workFlowStatusResponse);
          await _navigationHandler.navigateToScanQrCode(
              int.parse(workFlowStatusResponse.data!.data[2].toString()));
        } catch (e) {
          return _showAlertForErrorMessage(
              "Something went wrong,Please try again later!");
        }
        break;
      case DeviceRegInitiated :
        _saveData(workFlowStatusResponse);
        await _navigationHandler.navigateToScanQrCode(
            int.parse(workFlowStatusResponse.data!.data[2].toString()));
        break;
      case DeviceRegSuccess :
        //TODO Need TO Pass IMEI Number
        _navigationHandler.navigateToMDM(imei1:workFlowStatusResponse.data!.data[2]["imei1"],imei2: workFlowStatusResponse.data!.data[2]["imei2"]);
        break;
      case MDMRegInitiated :
        _navigationHandler.navigateToMDMSuccess("");
        break;
      case MDMRegSuccess :
        _navigationHandler.navigateToFinalSuccess();
        break;
      case RepaymentInitiated :
        //TODO Navigate to Repayment_Initiated Screen
        break;
      case RepaymentSuccess :
        //TODO Navigate to Repayment_Success Screen
        break;
    }
  }

  Future<void> _saveData(WorkFlowStatusResponse workFlowStatusResponse) async {
    await _verifyOtpUseCase.saveCustomerId(
        '${workFlowStatusResponse.data!.data[3]["customerId"]}');
    await _verifyOtpUseCase
        .setPaymentId('${workFlowStatusResponse.data!.data[3]["paymentId"]}');
    await _verifyOtpUseCase.saveMobileNumber(
        '${workFlowStatusResponse.data!.data[3]["mobileNumber"]}');
    await _verifyOtpUseCase
        .setDeviceId('${workFlowStatusResponse.data!.data[2]}');
    await _verifyOtpUseCase.loanCalled('');
  }
}
