import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:passcode/passcode_module.dart';
import 'package:passcode/sub_features/passcode/state/passcode_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../view_model/passcode_coordinator.dart';
import 'package:config/Colors.dart' as config_colors;
import 'package:get/get.dart';

class CrayonPasscodeScreen extends StatefulWidget {
  static const viewPath = '${PasscodeModule.moduleIdentifier}/passcode';
  final PasscodeScreenArgs passcodeScreenArgs;

  const CrayonPasscodeScreen({Key? key, required this.passcodeScreenArgs})
      : super(key: key);

  @override
  State<CrayonPasscodeScreen> createState() => _CrayonPasscodeScreenState();
}

class _CrayonPasscodeScreenState extends State<CrayonPasscodeScreen> {
  TextEditingController passcodeController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) =>
      BaseView<PasscodeCoordinator, CreatePasscodeState>(
        setupViewModel: (coordinator) {
          coordinator.initialiseState(
            context,
            widget.passcodeScreenArgs.title,
            widget.passcodeScreenArgs.description,
            widget.passcodeScreenArgs.destinationPath,
            widget.passcodeScreenArgs.passCodeVerificationType,
            widget.passcodeScreenArgs.initialPasscode,
          );
        },
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(
            bottom: false,
            child: state.when(
              initialState: () => const SizedBox(),
              ready: (
                _,
                __,
                ___,
                ____,
                _____,
                ______,
                _______,
                ________,
                _________,
                __________,
                ___________________,
              ) =>
                  _buildMainUIWithLoading(
                context,
                coordinator,
                (state as CreatePasscodeReady),
              ),
            ),
          ),
        ),
      );

  Widget _buildMainUIWithLoading(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(CreatePasscodeReady state) {
    if (state.isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(
            color: config_colors.PRIMARY_COLOR),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _onBoardingProgressBar(coordinator, state),
            Expanded(child: _enterOtpWidget(context, coordinator, state)),
            const SizedBox(
              height: 30,
            ),
            //_keyPad(context, coordinator)
          ],
        ),
      ),
    );
  }

  Widget _onBoardingProgressBar(
      PasscodeCoordinator coordinator, CreatePasscodeReady state) {
    if (!widget.passcodeScreenArgs.hasProgressBar) {
      return Container();
    }
    return Padding(
      key: const Key('passcodeProgress'),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: OnBoardingProgressBar(
        currentStep: state.currentStep,
        totalSteps: 4,
      ),
    );
  }

  Widget _enterOtpWidget(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _enterOtpInstruction(context, coordinator, state),
          _enterOtpInteractionWidgets(context, coordinator, state),
          _passcodeTipInstruction(context, state),
          // if (_isForgot) _forgetPassword(context, coordinator, state)
        ],
      ),
    );
  }

  Widget _enterOtpInstruction(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 53),
            width: double.infinity,
            child: CrayonPaymentText(
              key: const Key('passcodeTitle'),
              text: TextUIDataModel(
                state.pageTitle.tr,
                styleVariant: CrayonPaymentTextStyleVariant.bodyText1,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 55.0),
          _buildLogo(context),
          const SizedBox(height: 55.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: CrayonPaymentText(
              key: const Key('passcodeDescription'),
              text: TextUIDataModel(
                state.pageDescription.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
                color: _getDescriptionColor(state),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      OB_AppLogo,
      key: const Key('passcodeLogo'),
      height: 70,
      width: 67,
      fit: BoxFit.cover,
    );
  }

  Widget _enterOtpInteractionWidgets(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return Container(
      padding: const EdgeInsets.only(
        top: 28,
        bottom: 28,
      ),
      child: _otpInputWidget(context, coordinator, state),
    );
  }

  Widget _otpInputWidget(
    BuildContext context,
    PasscodeCoordinator coordinator,
    CreatePasscodeReady state,
  ) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.none,
                enabled: true,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    borderWidth: 3,
                    activeFillColor: Colors.white,
                    disabledColor: Colors.white,
                    selectedColor: Colors.black,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey),
                cursorColor: Colors.black,
                enableActiveFill: false,
                autoFocus: true,
                autoDismissKeyboard: false,
                autoDisposeControllers: false,
                //errorAnimationController: errorController,
                controller: passcodeController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                  coordinator.onPasscodeCallback(passcodeController.text,
                      widget.passcodeScreenArgs.userType);
                  passcodeController.clear();
                },
                onChanged: (String value) {},
              )),
          // ObscuredDigitEntryInputField(
          //   6,
          //   state.currentPasscode,
          //   key: Key('otpWidget'),
          // ),
        ),
        if (state.error.isNotEmpty) const SizedBox(height: 8),
        if (state.error.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.center,
              child: CrayonPaymentText(
                key: const Key('errorMessageText'),
                text: TextUIDataModel(
                  state.error.tr,
                  color: Colors.black,
                  styleVariant: CrayonPaymentTextStyleVariant.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _passcodeTipInstruction(
    BuildContext context,
    CreatePasscodeReady state,
  ) {
    if (state.passCodeVerificationType != PassCodeVerificationType.create) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 64,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: CrayonPaymentText(
        key: const Key('passcodeTipInstruction'),
        text: TextUIDataModel(
          'PC_passcode_tip'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: config_colors.SU_label_color,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color _getDescriptionColor(
    CreatePasscodeReady state,
  ) {
    return state.pageDescription.contains('PC_passcode_message') ||
            state.pageDescription.contains('PC_re_enter_passcode')
        ? config_colors.SU_label_color
        : Colors.red;
  }

  // Widget _keyPad(BuildContext context, PasscodeCoordinator coordinator) {
  //   return Directionality(
  //     textDirection: TextDirection.ltr,
  //     child: SizedBox(
  //       height: 250,
  //       child: CrayonPaymentKeyPad(
  //         context,
  //         coordinator.updatePasscodeInput,
  //         hasActionButton: false,
  //       ),
  //     ),
  //   );
  // }
}
