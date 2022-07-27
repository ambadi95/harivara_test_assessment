import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../login_module.dart';
import '../state/login_state.dart';
import '../viewmodel/login_coordinator.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  factory Login.forCustomerApp() => Login();
  final String _identifier = 'login';
  static const String viewPath = '${LoginModule.moduleIdentifier}/login';

  Login({Key? key}) : super(key: key);

  bool isBtnEnabled = false;
  String mobileNumberError = '';
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController passcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginCoordinator, LoginState>(
      onStateListenCallback: (preState, newState) =>
      {_listenToStateChanges(context, newState)},
      setupViewModel: (coordinator) {},
      builder: (context, state, coordinator) {
        return _buildMainUI(context, coordinator);
      },
    );
  }

  Widget _buildMainUI(context, LoginCoordinator coordinator) {
    return CrayonPaymentScaffold(
        appBarAttributes: CrayonPaymentAppBarAttributes(
          key: const Key('CardDetailsScreen_AppBarBackButton'),
          left: [
            const CrayonPaymentAppBarButtonType.back(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            dynamicHSpacer(36),
            _buildLabelTextFieldMobNumber(context, 'SU_mobile_no_label'.tr, coordinator),
            dynamicHSpacer(48),
            _passcodeWidget(context, coordinator),
            const Spacer(),
            actionButton(coordinator),
            dynamicHSpacer(20),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_LS_Login'),
      text: const TextUIDataModel('LS_Login',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }


  Widget _buildLabelTextFieldMobNumber(BuildContext context, String label, LoginCoordinator coordinator) {
    return  InputNumberFieldWithLabel(
      label: label,
      controller: mobileNumber,
      errorText: mobileNumberError.tr,
      hintText: 'SU_subtitle_hint'.tr,
      key: const Key('mobileNumberTextField'),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if(mobileNumberError.isNotEmpty || mobileNumber.text.length > 9){
          coordinator.isMobileNumberValid(mobileNumber.text);
        }
      },
    );
  }

  Widget actionButton(LoginCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: const Key('SignInButton'),
      title: 'LS_SignIn'.tr,
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: isBtnEnabled ?  LS_ButtonColor : SU_grey_color,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
      onPressed: () {
        coordinator.isMobileNumberValid(mobileNumber.text);
        if(isBtnEnabled){
          coordinator.navigateToWelcomeBackScreen();
        }

      },
    );
  }

  Widget _passcodeWidget(BuildContext context, LoginCoordinator coordinator) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CrayonPaymentText(
                key: Key('${_identifier}_LS_Passcode'),
                text: const TextUIDataModel(
                  'LS_Passcode',
                  styleVariant: CrayonPaymentTextStyleVariant.headline5,
                  color: AN_TitleColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              PinCodeTextField(
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
                autoFocus: false,
                autoDismissKeyboard: true,
                //errorAnimationController: errorController,
                controller: passcodeController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (String value) {
                  _validateForm(coordinator);
                },
              ),
            ],
          )),
    );
  }

  void _listenToStateChanges(BuildContext context, LoginState state) {
    state.maybeWhen(
      (loginList) {

      },
        mobileNumberError: (message){
          mobileNumberError = message;
        },
        loginFormState: (isValid){
        isBtnEnabled = isValid;
        },

        orElse: () => null);
  }

  void _validateForm(LoginCoordinator coordinator) {
    coordinator.validateForm(mobileNumber.text, passcodeController.text);
  }
}
