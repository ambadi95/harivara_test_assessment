import 'package:flutter/material.dart';
import 'package:passcode/navigation_handler/passcode_navigation_handler.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

import '../state/passcode_state.dart';

class PasscodeCoordinator extends BaseViewModel<CreatePasscodeState> {
  final PasscodeNavigationHandler _navigationHandler;
  final PasscodeUseCase _passcodeUseCase;

  PasscodeCoordinator(this._navigationHandler, this._passcodeUseCase)
      : super(const CreatePasscodeState.initialState());

  void initialiseState(BuildContext context,
      String pageTitle,
      String pageDescription,
      String destinationPath,
      PassCodeVerificationType passCodeVerificationType,
      String initialPasscode,) async {
    state = CreatePasscodeState.ready(
      context: context,
      initialPasscode: initialPasscode,
      currentPasscode: '',
      pageDescription: pageDescription,
      destinationPath: destinationPath,
      pageTitle: pageTitle,
      passcodeLength: 6,
      passCodeVerificationType: passCodeVerificationType,
    );
  }

  Future<void> updatePasscodeInput(KeypadButtonType keypadButtonType,) async {
    var currentState = state as CreatePasscodeReady;
    var previousPasscode = currentState.currentPasscode;
    var passcodeLength = currentState.passcodeLength;

    var updatedPasscode = _passcodeUseCase.updateCurrentPasscode(
      keypadButtonType,
      previousPasscode,
      passcodeLength,
    );

    state = currentState.copyWith(
      currentPasscode: updatedPasscode,
    );
    if (updatedPasscode.length == currentState.passcodeLength) {
      await onPasscodeCallback(updatedPasscode);
    }
  }

  Future<void> onPasscodeCallback(String passCode,) async {
    var currentState = state as CreatePasscodeReady;
    switch (currentState.passCodeVerificationType) {
      case PassCodeVerificationType.create:
        await createPassCode(passCode);
        break;
      case PassCodeVerificationType.verify:
        await verifyPasscode(
          currentState.initialPasscode,
          passCode,
          currentState.destinationPath,
        );
        break;
      case PassCodeVerificationType.verifyMerchantPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.customerSign:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.payment:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.reset:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.newPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.changePasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.changePasscodeMerchant:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.changeNewPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.changeNewMerchantPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.changeConfirmMerchantPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.reEnterPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.activateBiometric:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.resetNewPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.resetReEnterPasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.merchantOneTimePasscode:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.merchantSignIn:
        // TODO: Handle this case.
        break;
    }
  }


  Future<void> createPassCode(String passcode) async {
    var currentState = state as CreatePasscodeReady;
    var error = await _passcodeUseCase.validateCustomerPasscode(passcode);
    if (error.isEmpty) {
      state = currentState.copyWith(
        passCodeVerificationType: PassCodeVerificationType.verify,
        pageTitle: 'PC_confirm_passcode',
        pageDescription: 'PC_re_enter_passcode',
        currentPasscode: '',
        initialPasscode: passcode,
      );
    } else {
      state = currentState.copyWith(
        pageDescription: 'PC_passcode_repetitive_message',
        currentPasscode: '',
      );
    }
  }

  Future<void> verifyPasscode(
      String oldPassCode,
      String newPasscode,
      String destinationPath,
      ) async {
    var currentState = state as CreatePasscodeReady;
    if (oldPassCode == newPasscode) {
      await _passcodeUseCase.savePassCode(newPasscode);
      _navigateToDestinationPath(destinationPath);
    } else {
      state = currentState.copyWith(
        pageDescription: 'PC_passcode_does_not_match',
        passCodeVerificationType: PassCodeVerificationType.create,
        pageTitle: 'PC_create_passcode',
        initialPasscode: '',
        currentPasscode: '',
      );
    }
  }

  Future<void> _navigateToDestinationPath(String destinationPath) async {
    _navigationHandler.navigateToDestinationPath(destinationPath);
  }

}
