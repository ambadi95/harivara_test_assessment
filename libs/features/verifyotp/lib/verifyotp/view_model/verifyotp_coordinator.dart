import 'package:flutter/material.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:verifyotp/navigation_handler/verifyotp_navigation_handler.dart';
import 'package:verifyotp/verifyotp/state/verify_otp_state.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_usecase.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';


class VerifyOtpCoordinator extends BaseViewModel<VerifyOtpState> {
    final VerifyOtpNavigationHandler _navigationHandler;
  final VerifyOtpUseCase _verifyOtpUseCase;

  VerifyOtpCoordinator(this._navigationHandler, this._verifyOtpUseCase)
      : super(const VerifyOtpState.initialState());

  void initialiseState(BuildContext context,
      String pageTitle,
      String pageDescription,
      String destinationPath,
      OtpVerificationType otpVerificationType,
      String initialPasscode,) async {
    state = VerifyOtpState.ready(
      context: context,
      initialPasscode: initialPasscode,
      currentPasscode: '',
      pageDescription: pageDescription,
      destinationPath: destinationPath,
      pageTitle: pageTitle,
      passcodeLength: 6,
      otpVerificationType: otpVerificationType,
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
      }else if(otpVerificationType == OtpVerificationType.customerSign){
        _navigationHandler.navigateToCustomerEnrollmentScreen();
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


  Future<void> onVerifyPasscode(String passCode,String userType) async {
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
  Future<void> verifyPasscode(
      String oldPassCode,
      String newPasscode,
      String destinationPath,
      String userType
      ) async {
    // var currentState = state as VerifyOtpStateReady;
    //
   // onVerifyPasscode(newPasscode);
    //navigateToDestinationPath(destinationPath, userType);
  }

  Future<void> navigateToDestinationPath(String destinationPath, String userType, OtpScreenArgs otpScreenArgs) async {
    if(otpScreenArgs.otpVerificationType == OtpVerificationType.mobile){
      if(userType == 'Customer') {
        _navigationHandler.navigateToDestinationPath(destinationPath, userType);
      }else{
        _navigationHandler.openForNewPasscode(userType);
      }
    }else if(otpScreenArgs.otpVerificationType == OtpVerificationType.agentSignIn){
    _navigationHandler.navigateToAgentWelcomeBack(userType);
    }else if(otpScreenArgs.otpVerificationType == OtpVerificationType.customerSign){
      _navigationHandler.navigateToCustomerEnrollmentScreen();
    }else if(otpScreenArgs.otpVerificationType == OtpVerificationType.updatePasscodeAgent){
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

}
