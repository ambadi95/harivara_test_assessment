import 'dart:async';

import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:sprintf/sprintf.dart';
import 'package:verifyotp/verifyotp_module.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../state/verify_otp_state.dart';
import '../view_model/verifyotp_coordinator.dart';

class CrayonVerifyOtpScreen extends StatefulWidget {
  static const viewPath = '${VerifyOtpModule.moduleIdentifier}/verifyotp';
  final OtpScreenArgs otpScreenArgs;

  const CrayonVerifyOtpScreen({Key? key, required this.otpScreenArgs})
      : super(key: key);

  @override
  State<CrayonVerifyOtpScreen> createState() => _CrayonVerifyOtpScreenState();
}

class _CrayonVerifyOtpScreenState extends State<CrayonVerifyOtpScreen> {
  late Timer _timer;
  ValueNotifier<int> _startValue = ValueNotifier<int>(60);
  bool showError = false;
  bool isBtnEnabled = false;
  int attemptCount = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startValue.value == 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            _startValue.value--;
          }
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<VerifyOtpCoordinator, VerifyOtpState>(
        setupViewModel: (coordinator) {
          coordinator.generateOtp(
              widget.otpScreenArgs.refId,
              widget.otpScreenArgs.userType,
              widget.otpScreenArgs.otpVerificationType,
              widget.otpScreenArgs.event,
              widget.otpScreenArgs);
          coordinator.initialiseState(
            context,
            widget.otpScreenArgs.title,
            widget.otpScreenArgs.description,
            widget.otpScreenArgs.destinationPath,
            widget.otpScreenArgs.otpVerificationType,
            widget.otpScreenArgs.event,
          );
        },
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(
            bottom: false,
            child: state.when(
                initialState: () => SizedBox(),
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
                  _____________,
                  ____________,
                ) =>
                    _buildMainUIWithLoading(
                      context,
                      coordinator,
                      (state as VerifyOtpStateReady),
                    )),
          ),
        ),
      );

  Widget _buildMainUIWithLoading(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(VerifyOtpStateReady state) {
    if (state.isLoading) {
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    return Scaffold(
      bottomNavigationBar: _buildContinueButton(coordinator, state),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _onBoardingProgressBar(),
              _buildHeader(context, coordinator, state),
              _enterOtpInstruction(context, coordinator, state),
              const SizedBox(
                height: 200,
              ),
              _enterOtpWidget(context, coordinator, state),
              const SizedBox(
                height: 5,
              ),
              /*state.attemptsRemain != 3*/
              attemptCount > 0 && attemptCount < 4 && showError //3
                  ? _errorAndAttemptLeft(context, coordinator, state)
                  : const SizedBox(),
              const SizedBox(
                height: 60,
              ),
              _didGetCode(context),
              const SizedBox(
                height: 10,
              ),
              _resendWidget(context, coordinator)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(
      VerifyOtpCoordinator coordinator, VerifyOtpStateReady state) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: InkWell(
        onTap: () async {
          if (kDebugMode) {
            print(attemptCount);
          }
          if (attemptCount <= 3) {
            if (coordinator.otpController.text.isNotEmpty &&
                coordinator.otpController.text.length == 6) {
              await coordinator.navigateToDestinationPath(
                  widget.otpScreenArgs.destinationPath,
                  widget.otpScreenArgs.userType,
                  widget.otpScreenArgs,
                  coordinator.otpController.text.toString(),
                  widget.otpScreenArgs.event);
              if(!coordinator.isCorrectOtp) {
                if (attemptCount == 3) {
                  _showAlertForOTPAttempts(coordinator);
                  attemptCount++;
                } else {

                  setState(() {
                    attemptCount++;
                  });
                }
              }
              print(attemptCount);
            }
            // else {
            //   _showAlertForOTPAttempts(coordinator);
            // }
          } else {
            _showAlertForOTPAttempts(coordinator);
          }
          setState(() {
            showError = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: isBtnEnabled ? LS_ButtonColor : SU_grey_color,
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: Text(
                'VO_verify_button'.tr,
                style: SU_button_text_style,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showAlertForOTPAttempts(VerifyOtpCoordinator coordinator) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: 'VO_Incorrect_OTP_Alert_Msg'.tr,
          alertTitle: 'VO_Incorrect_OTP_Title'.tr,
          alertIcon: "assets/images/incorrect_otp.png",
          onBottomButtonPress: () {
            if (widget.otpScreenArgs.otpVerificationType ==
                OtpVerificationType.customerSignUpAgent) {
              coordinator.goBack();
              coordinator.goBack();
              coordinator.goBack();
            } else {
              coordinator.backSignUp(widget.otpScreenArgs.userType);
            }

            // if(widget.otpScreenArgs.userType == UserType.Agent) {
            //   coordinator.backSignUp(widget.otpScreenArgs.userType);
            // } else{
            //   coordinator.backAgentDashboard();
            // }
          },
          bottomButtonText: widget.otpScreenArgs.otpVerificationType ==
                  OtpVerificationType.customerSignUpAgent
              ? 'Back_To_Home'.tr
              : 'VO_Back_button'.tr,
          /*onClose: () {
            coordinator.goBack();
          },*/
          packageName: ""),
      isScrollControlled: false,
      isDismissible: false,
    );
  }

  Widget _onBoardingProgressBar() {
    if (!widget.otpScreenArgs.hasProgressBar) {
      return Container();
    }
    return Padding(
      key: Key('otp verify progress'),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: OnBoardingProgressBar(
        currentStep: widget.otpScreenArgs.currentStep,
        totalSteps: 4,
      ),
    );
  }

  Widget _enterOtpWidget(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _enterOtpInteractionWidgets(context, coordinator, state),
        ],
      ),
    );
  }

  Widget _enterOtpInstruction(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    var descriptionMessage = widget.otpScreenArgs.description.tr;
    if (widget.otpScreenArgs.phoneNumber.isNotEmpty) {
      descriptionMessage = descriptionMessage.replaceAll(
        '{}',
        widget.otpScreenArgs.phoneNumber
            .substring(widget.otpScreenArgs.phoneNumber.length - 3),
      );
    }
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrayonPaymentText(
            key: const Key('otp verification description'),
            text: TextUIDataModel(
              descriptionMessage.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: VO_DescriptionColor,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _enterOtpInteractionWidgets(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    return Container(
      padding: const EdgeInsets.only(
        left: 28,
        right: 28,
        top: 28,
        bottom: 28,
      ),
      child: _otpInputWidget(context, coordinator, state),
    );
  }

  Widget _otpInputWidget(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
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
            autoDisposeControllers: false,
            autoFocus: true,
            autoDismissKeyboard: true,
            //errorAnimationController: errorController,
            controller: coordinator.otpController,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              setState(() {
                isBtnEnabled = true;
                showError = false;
              });
            },
            onChanged: (String value) {
              setState(() {
                isBtnEnabled = false;
                showError = false;
              });
            },
          ),
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

  _buildHeader(BuildContext context, VerifyOtpCoordinator coordinator,
      VerifyOtpStateReady state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonBackButton(
          key: const Key('signup_backButton'),
          color: Colors.black,
          onPressed: () {
            coordinator.goBack();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CrayonPaymentText(
            key: const Key('verify otp title'),
            text: TextUIDataModel(
              'VO_OtpVerification'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline2,
              color: VO_TitleColor,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }

  _errorAndAttemptLeft(
    BuildContext context,
    VerifyOtpCoordinator coordinator,
    VerifyOtpStateReady state,
  ) {
    print("how much attempts =====> $attemptCount");
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          CrayonPaymentText(
            key: const Key('verifyOtp incorrect otp'),
            text: TextUIDataModel(
              /*state.attemptsRemain*/
              attemptCount == 1
                  ? 'VO_Incorrect_OTP'.tr
                  //: '${'VO_Incorrect_OTP_Title'.tr}. ${3 - attemptCount} attempts remaining',
                  : '${4 - attemptCount}' + " " + 'VO_attempts_remaining'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: HS_NotificationCountColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _resendWidget(BuildContext context, VerifyOtpCoordinator coordinator) {
    return ValueListenableBuilder<int>(
        valueListenable: _startValue,
        builder: (BuildContext context, int value, Widget? child) {
          return Align(
            alignment: Alignment.center,
            child: value != 0
                ? CrayonPaymentText(
                    key: const Key('verifyOtp Resend Now'),
                    text: TextUIDataModel(
                      sprintf(
                        'VO_resend_otp'.tr,
                        [value],
                      ),
                      styleVariant: CrayonPaymentTextStyleVariant.headline5,
                      color: VO_ResendTextColor,
                      textAlign: TextAlign.center,
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      startTimer();
                      coordinator.otpController.clear();
                      await coordinator.generateOtp(
                          widget.otpScreenArgs.refId,
                          widget.otpScreenArgs.userType,
                          widget.otpScreenArgs.otpVerificationType,
                          widget.otpScreenArgs.event);
                    },
                    child: CrayonPaymentText(
                      key: const Key('verifyOtp Resend Now'),
                      text: TextUIDataModel(
                        'VO_ResendNow'.tr,
                        styleVariant: CrayonPaymentTextStyleVariant.headline5,
                        color: SU_subtitle_terms_color,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // otpController.dispose();
    _timer.cancel();
  }

  Widget _didGetCode(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          CrayonPaymentText(
            key: const Key('verifyOtp Didnt Get Code'),
            text: TextUIDataModel(
              'VO_DidNotGetCode'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: VO_ResendTextColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
