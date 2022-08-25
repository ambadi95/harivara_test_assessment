import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:verifyotp/navigation_handler/verifyotp_navigation_handler.dart';
import 'package:verifyotp/verifyotp/state/verify_otp_state.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_usecase.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
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

  Future<void> generateOtp(String id, String userType,
      OtpVerificationType otpVerificationType) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    var response;
    if (otpVerificationType == OtpVerificationType.customerSignUpAgent) {
      response = await _verifyOtpUseCase.otpGenCustomerByAgent(
          id, 'Customer', (p0) => null);
    } else {
      response = await _verifyOtpUseCase.otpGen(id, userType, (p0) => null);
    }
    if (response?.status == true) {
      int otp1 = response?.data?.token as int;
      otp = otp1.toString();
      //otpController.text = otp;
      CrayonPaymentLogger.logInfo(otp);
    }
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
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
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

  Future<void> navigateToDestinationPath(String destinationPath,
      String userType, OtpScreenArgs otpScreenArgs, String enterOtp) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    var currentState = state as VerifyOtpStateReady;
    int attempts = currentState.attemptsRemain;
    if (otpScreenArgs.otpVerificationType == OtpVerificationType.customerSign) {
      var responseSignin = await _verifyOtpUseCase.otpVerify(
          otpScreenArgs.refId, enterOtp,otpScreenArgs.userType, (p0) => null);
      if (responseSignin!.status == true) {
        _navigationHandler.navigateToCustomerEnrollmentScreen();
      } else {
        print('error');
      }
    } else if (otpScreenArgs.otpVerificationType ==
        OtpVerificationType.customerSignUpAgent) {
      var responseSignin = await _verifyOtpUseCase.otpVerifyCustomerByAgent(
          otpScreenArgs.refId, enterOtp, 'Customer', (p0) => null);
      if (responseSignin!.data!.status == "success") {
        _navigationHandler.navigateToDestinationPath(
            destinationPath, 'AgentCustomer');
      }
    } else if (otpScreenArgs.otpVerificationType ==
        OtpVerificationType.mobile) {
      if (userType == 'Customer') {
        state = currentState.copyWith(isLoading: true);
        var response = await _verifyOtpUseCase.otpVerify(otpScreenArgs.refId,
            enterOtp, otpScreenArgs.userType, (p0) => null);
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
            enterOtp, otpScreenArgs.userType, (p0) => null);
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
          otpScreenArgs.refId, enterOtp, otpScreenArgs.userType, (p0) => null);
      if (responseSignin?.status == true) {
        _navigationHandler.navigateToAgentWelcomeBack(userType);
      }
    } else if (otpScreenArgs.otpVerificationType ==
        OtpVerificationType.updatePasscodeAgent) {
      _navigationHandler.openForUpdateNewPasscode(userType);
    }
  }

  Future<void> goBack() async {
    _navigationHandler.goBack();
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
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }
}
