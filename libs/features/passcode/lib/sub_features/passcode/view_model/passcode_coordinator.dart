import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:flutter/material.dart';
import 'package:passcode/navigation_handler/passcode_navigation_handler.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';
import 'package:get/get.dart';
import '../state/passcode_state.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
class PasscodeCoordinator extends BaseViewModel<CreatePasscodeState> {
  final PasscodeNavigationHandler _navigationHandler;
  final PasscodeUseCase _passcodeUseCase;

  PasscodeCoordinator(this._navigationHandler, this._passcodeUseCase)
      : super(const CreatePasscodeState.initialState());

  void initialiseState(
    BuildContext context,
    String pageTitle,
    String pageDescription,
    String destinationPath,
    PassCodeVerificationType passCodeVerificationType,
    String initialPasscode,
  ) async {
    state = CreatePasscodeState.ready(
        context: context,
        initialPasscode: initialPasscode,
        currentPasscode: '',
        pageDescription: pageDescription,
        destinationPath: destinationPath,
        pageTitle: pageTitle,
        passcodeLength: 6,
        passCodeVerificationType: passCodeVerificationType,
        currentStep: 4);
  }

  // Future<void> updatePasscodeInput(KeypadButtonType keypadButtonType,) async {
  //   var currentState = state as CreatePasscodeReady;
  //   var previousPasscode = currentState.currentPasscode;
  //   var passcodeLength = currentState.passcodeLength;
  //
  //   var updatedPasscode = _passcodeUseCase.updateCurrentPasscode(
  //     keypadButtonType,
  //     previousPasscode,
  //     passcodeLength,
  //   );
  //
  //   state = currentState.copyWith(
  //     currentPasscode: updatedPasscode,
  //   );
  //   if (updatedPasscode.length == currentState.passcodeLength) {
  //     await onPasscodeCallback(updatedPasscode);
  //   }
  // }

  Future<void> onPasscodeCallback(String passCode, String userType) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
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
          userType,
        );
        break;
      case PassCodeVerificationType.agentResetPasscode:
        createResetPassCode(passCode);
        break;
      case PassCodeVerificationType.agentVerifyResetPasscode:
        await verifyPasscodeReset(currentState.initialPasscode, passCode,
            currentState.destinationPath, userType);
        break;
      case PassCodeVerificationType.agentSignIn:
        _navigationHandler
            .navigateToAgentHomeScreen('homemodule/CrayonHomeScreen');
        break;
      case PassCodeVerificationType.customerSign:
        // TODO: Handle this case.
        break;
      case PassCodeVerificationType.agentCustomerPasscode:
        // TODO: Handle this case.
        break;
    }
  }

  Future<void> createPassCode(String passcode) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
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

  Future<void> createResetPassCode(String passcode) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    var currentState = state as CreatePasscodeReady;
    var error = await _passcodeUseCase.validateCustomerPasscode(passcode);
    if (error.isEmpty) {
      state = currentState.copyWith(
        passCodeVerificationType:
            PassCodeVerificationType.agentVerifyResetPasscode,
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
    String userType,
  ) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    var currentState = state as CreatePasscodeReady;
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    print(userType);
    if (oldPassCode == newPasscode) {
      state = currentState.copyWith(currentStep: 5);
      await _passcodeUseCase.savePassCodeLocal(newPasscode);
      if (userType == "Customer") {
        state = currentState.copyWith(isLoading: true);
        var response = await _passcodeUseCase.savePasscode(
            newPasscode, userType, (p0) => null);
        if (response!.status == true) {
          var loginResponse =
              await _passcodeUseCase.login(newPasscode, (p0) => null);
          if (loginResponse?.status == true) {
            state = currentState.copyWith(isLoading: false);
            _navigationHandler.navigateToCustomerEnrollmentScreen(
                destinationPath, false, UserType.Customer);
          }
        }
      } else if (userType == 'Agent') {
        state = currentState.copyWith(isLoading: true);
        var response = await _passcodeUseCase.savePasscodeAgent(
            newPasscode, userType, (p0) => null);
        if (response!.status == true) {
          state = currentState.copyWith(currentStep: 5);
          var loginResponse =
              await _passcodeUseCase.loginAgent(newPasscode, (p0) => null);
          if (loginResponse!.status == true) {
            String agentId = await _passcodeUseCase.getAgentId();
            await _passcodeUseCase.saveOnBordStatus(agentId);
            String agentName = await _passcodeUseCase.getAgentName();
            _navigationHandler.navigateToAgentEnrollmentBottomSheet(
                'AE_Message'.tr.replaceAll('_name_', agentName),
                'AE_Continue'.tr);
            state = currentState.copyWith(isLoading: false);
          } else {
            state = currentState.copyWith(isLoading: false);
            CrayonPaymentLogger.logError(loginResponse.message!);
          }
        } else {
          state = currentState.copyWith(isLoading: false);
          CrayonPaymentLogger.logError(response.message!);
        }
      } else {
        state = currentState.copyWith(isLoading: true);
        var response = await _passcodeUseCase.savePasscodeAgentCustomer(
            newPasscode, userType, (p0) => null);
        if (response!.status == true) {
          state = currentState.copyWith(isLoading: false);
          _navigationHandler.navigateToCustomerEnrollmentScreen(
              destinationPath, false, UserType.AgentCustomer);
        }
      }
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

  Future<void> verifyPasscodeReset(
    String oldPassCode,
    String newPasscode,
    String destinationPath,
    String userType,
  ) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    var currentState = state as CreatePasscodeReady;
    if (oldPassCode == newPasscode) {
      state = currentState.copyWith(currentStep: 5);
      await _passcodeUseCase.savePassCodeLocal(newPasscode);
      if (userType == "Customer") {
        _navigationHandler.navigateToCustomerEnrollmentScreen(
            destinationPath, true, UserType.Customer);
      } else {
        _navigationHandler.navigateToResetPasscodeBottomSheet(
            'RP_Passcode_Reset'.tr, 'RP_Continue'.tr, 'RP_Passcode_Desc'.tr);
      }
    } else {
      state = currentState.copyWith(
        pageDescription: 'PC_passcode_does_not_match',
        passCodeVerificationType: PassCodeVerificationType.agentResetPasscode,
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
