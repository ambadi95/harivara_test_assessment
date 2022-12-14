import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../login_module.dart';
import '../state/login_state.dart';
import '../viewmodel/login_coordinator.dart';
import 'package:get/get.dart';
import 'package:config/Config.dart';

class Login extends StatefulWidget {
  final UserType userType;
  static const String viewPath = '${LoginModule.moduleIdentifier}/login';

  Login({Key? key, required this.userType}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _identifier = 'login';

  bool isBtnEnabled = false;

  bool havePasscode = false;

  String mobileNumberError = '';

  String agentIdError = '';

  TextEditingController mobileNumber = TextEditingController();

  TextEditingController passcodeController = TextEditingController();

  TextEditingController agentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginCoordinator, LoginState>(
      onStateListenCallback: (preState, newState) =>
          {_listenToStateChanges(context, newState)},
      setupViewModel: (coordinator) async {
        await coordinator.calljwttoken();
      },
      builder: (context, state, coordinator) {
        return state.maybeWhen(
            loading: () => _buildMainUIWithLoading(context, coordinator),
            orElse: () => _buildMainUI(context, coordinator));
      },
    );
  }

  @override
  void dispose() {
    passcodeController.dispose();
    agentIdController.dispose();
    mobileNumber.dispose();
    super.dispose();
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    LoginCoordinator coordinator,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainUI(context, coordinator),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
    );
  }

  Widget _buildMainUI(context, LoginCoordinator coordinator) {
    return CrayonPaymentScaffold(
        appBarAttributes: CrayonPaymentAppBarAttributes(
          key: const Key('CardDetailsScreen_AppBarBackButton'),
          left: [
            CrayonPaymentAppBarButtonType.back(onPressed: () {
              coordinator.goBackWelcomeScreen(widget.userType);
            }),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 70,
            child: Column(
              children: [
                actionButton(coordinator),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              SizedBox(
                height: 66,
              ),
              _buildLabelTextFieldMobNumber(
                  context, 'LS_Mobile'.tr, coordinator),
              SizedBox(
                height: 48,
              ),
              widget.userType == UserType.Customer
                  ? havePasscode
                      ? _passcodeWidget(context, coordinator)
                      : SizedBox()
                  : _buildLabelTextField(
                      'LS_agent_id'.tr,
                      agentIdController,
                      TextInputType.text,
                      coordinator,
                      agentIdError,
                      'SU_agent_id_hint',
                      true),
              const SizedBox(
                height: 46,
              ),
              widget.userType == UserType.Customer
                  ? havePasscode
                      ? _buildResetPasscode(coordinator)
                      : SizedBox()
                  : _buildResetPasscode(coordinator),
            ],
          ),
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

  Widget _buildLabelTextFieldMobNumber(
      BuildContext context, String label, LoginCoordinator coordinator) {
    return InputNumberFieldWithLabel(
      label: label,
      controller: mobileNumber,
      errorText: mobileNumberError.tr,
      hintText: 'LS_mobile_hint_text'.tr,
      key: const Key('mobileNumberTextField'),
      inputFormatters: <TextInputFormatter>[
        NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' '),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _validateForm(coordinator);
        if (mobileNumberError.isNotEmpty || mobileNumber.text.trim().replaceAll(" ", "").length > 9) {
          coordinator.isMobileNumberValid(mobileNumber.text.trim().replaceAll(" ", ""));
        }
      },
    );
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      LoginCoordinator coordinator,
      String errorText,
      String hint,
      bool enabled) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          controller: controller,
          errorText: errorText.tr,
          enabled: enabled,
          hintText: hint.tr,
          key: const Key('detailsTextField'),
          inputFormatters: [
              FilteringTextInputFormatter(new RegExp(r"\s\b|\b\s"), allow: false),
              LengthLimitingTextInputFormatter(12),
          ],
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
            controller.text.trim();
            _validateForm(coordinator);
            if (errorText.isNotEmpty) {
              coordinator.isAgentIdValid(agentIdController.text.trim());
            }
          },
        ));
  }

  Widget actionButton(LoginCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: const Key('SignInButton'),
      title: 'LS_SignIn'.tr,
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: isBtnEnabled ? LS_ButtonColor : SU_grey_color,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
      onPressed: () {
        if (isBtnEnabled) {
          coordinator.isMobileNumberValid(mobileNumber.text.trim().replaceAll(" ", ""));
          coordinator.isAgentIdValid(agentIdController.text);
          // coordinator.navigateToWelcomeBackScreen(userType, mobileNumber.text.trim().replaceAll(" ", ""));
          if (UserType.Customer == widget.userType) {
            if (havePasscode) {
              if(passcodeController.text.length!=6){
                AppUtils.appUtilsInstance.showErrorBottomSheet(
                  title: "Invalid Passcode",
                  onClose: () {
                    Navigator.pop(context);
                  },
                );
                return ;
              }
              coordinator.login(
                mobileNumber.text.trim().replaceAll(" ", ""),
                passcodeController.text,
                widget.userType,
                agentIdController.text,
              );

            } else {

              coordinator.checkPasscode(
                mobileNumber.text.trim().replaceAll(" ", ""),
                widget.userType,
              );
            }
          } else {

            coordinator.login(mobileNumber.text.trim().replaceAll(" ", ""), passcodeController.text,
                widget.userType, agentIdController.text);
          }
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
                autoDisposeControllers: false,
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

  Widget _buildResetPasscode(LoginCoordinator coordinator) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: InkWell(
          onTap: () {
            coordinator.navigateToResetNow(widget.userType);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FORGET_PASSCODE'.tr,
                style: WB_forget_passcode_text_style,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'RESET_NOW'.tr,
                style: WB_reset_passcode_text_style,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _listenToStateChanges(BuildContext context, LoginState state) {
    state.maybeWhen(
        mobileNumberError: (message) {
          mobileNumberError = message;
        },
        loginFormState: (isValid) {
          isBtnEnabled = isValid;
        },
        agentIdError: (message) {
          agentIdError = message;
        },
        showPasscode: (hasPasscode) {
          havePasscode = hasPasscode;
        },
        orElse: () => null);
  }

  void _validateForm(LoginCoordinator coordinator) {
    coordinator.validateForm(mobileNumber.text.trim().replaceAll(" ", ""), passcodeController.text,
        agentIdController.text, widget.userType, havePasscode);
  }
}
