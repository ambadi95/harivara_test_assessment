import 'package:flutter/material.dart';
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

  Future<void> updatePasscodeInput(KeypadButtonType keypadButtonType,) async {
    var currentState = state as VerifyOtpStateReady;
    var previousPasscode = currentState.currentPasscode;
    var passcodeLength = currentState.passcodeLength;
    var updatedPasscode = _verifyOtpUseCase.updateCurrentOTP(
      keypadButtonType,
      previousPasscode,
      passcodeLength,
    );

    state = currentState.copyWith(
      currentPasscode: updatedPasscode,
    );

  }

  Future<void> onVerifyPasscode(String passCode,) async {
    var currentState = state as VerifyOtpStateReady;
    switch (currentState.otpVerificationType) {

      case OtpVerificationType.mobile:
        await verifyPasscode(
          currentState.initialPasscode,
          passCode,
          currentState.destinationPath,
        );
        break;
        case OtpVerificationType.retry:
        await verifyPasscode(
          currentState.initialPasscode,
          passCode,
          currentState.destinationPath,
        );
        break;

    }
  }


//verfiy passcode
  Future<void> verifyPasscode(
      String oldPassCode,
      String newPasscode,
      String destinationPath,
      ) async {
    // var currentState = state as VerifyOtpStateReady;
    //
    onVerifyPasscode(newPasscode);


  }

  Future<void> _navigateToDestinationPath(String destinationPath) async {
    _navigationHandler.navigateToDestinationPath(destinationPath);
  }

}
