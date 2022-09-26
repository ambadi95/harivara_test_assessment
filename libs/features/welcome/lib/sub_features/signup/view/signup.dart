import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/dropdown/crayon_drop_down.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:get/get.dart';
import 'package:shared_data_models/customer_onboard/payment_mode_list_respose/payment_mode_list_response/datum.dart';
import 'package:config/Config.dart';
import 'package:widget_library/utils/launcher_utils.dart';
import '../../../data_model/sign_up_arguments.dart';

class SignUp extends StatefulWidget {
  final SignUpArguments signUpArguments;
  static const viewPath = '${WelcomeModule.moduleIdentifier}/signup';

  const SignUp({required this.signUpArguments, Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isBtnEnabled = false;
  String nidaNumberError = '';
  String mobileNumberError = '';
  String agentIdError = '';
  String paymentModeError = '';
  TextEditingController nidaNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController agentId = TextEditingController();
  TextEditingController paymentMode = TextEditingController();

  Datum? _paymentMode;
  String agentType = '';

  List<DropdownMenuItem<Datum>> paymentModeDropDowm = [];

  List<Datum> telcoList= [];

  @override
  Widget build(BuildContext context) =>
      BaseView<SignUpCoordinator, SignUpState>(
          onStateListenCallback: (preState, newState) =>
              {_listenToStateChanges(context, newState)},
          setupViewModel: (coordinator) async {
            agentType =  await coordinator.getAgentType();
            await coordinator.calljwttoken();
            if(widget.signUpArguments.signupType == SignupType.agentAidedCustomerOnBoarding) {
              telcoList = await coordinator.getPaymentMode();
            }
            paymentModeDropDowm = getPaymentModeDropDownData(telcoList);
          },
          builder: (context, state, coordinator) => SafeArea(
                child: Scaffold(
                  bottomNavigationBar: state.maybeWhen(
                    loadingState: () =>
                        _buildMainUIWithLoading(context, coordinator),
                    orElse: () => SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          // widget.signUpArguments.userType == UserType.Customer
                          //     ? _carrierText()
                          //     :
                          const SizedBox(
                            height: 14,
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          _buildContinueButton(context, coordinator, state),
                        ],
                      ),
                    ),
                  ),
                  body: state.maybeWhen(
                    orElse: () => SingleChildScrollView(
                        child: SafeArea(
                      child: _UI(coordinator),
                    )),
                  ),
                ),
              ));

  Widget _UI(SignUpCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopContainer(context, coordinator),
        _buildMainUI(coordinator),
      ],
    );
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    SignUpCoordinator coordinator,
  ) {
    return Stack(
      children: [
        _UI(coordinator),
        _createLoading(),
      ],
    );
  }

  Widget _buildTopContainer(
    BuildContext context,
    SignUpCoordinator coordinator,
  ) {
    return Column(
      children: [
        // _onBoardingProgressBar(),
        _buildBackBtn(context, coordinator),
      ],
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(
            color: config_color.PRIMARY_COLOR),
      ),
    );
  }

  Widget _buildMainUI(SignUpCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(
            height: 16,
          ),
          _sub_title(coordinator),
          const SizedBox(
            height: 69,
          ),
          _buildLabelTextField(
              'SU_ID_no_label',
              nidaNumber,
              coordinator,
              widget.signUpArguments.userType == UserType.Agent
                  ? 'SU_title_hint_agent'
                  : 'SU_title_hint',
              nidaNumberError,
              TextInputType.number),
          const SizedBox(
            height: 48,
          ),
          widget.signUpArguments.userType == UserType.Customer
              ? _buildLabelTextFieldMobNumber('SU_mobile_no_label',
                  mobileNumber, coordinator, 'SU_subtitle_hint')
              : _buildLabelTextField('SU_agent_id_hint', agentId, coordinator,
                  'SU_agent_id_hint', agentIdError, TextInputType.text),
         const SizedBox(
            height: 36,
          ),
           agentType.isNotEmpty ? _buildPaymentModeDropdown(coordinator) : SizedBox()
        ],
      ),
    );
  }



  Widget _onBoardingProgressBar() {
    return widget.signUpArguments.isProgressBarVisible
        ? const Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 0),
            child: OnBoardingProgressBar(
              currentStep: 1,
              totalSteps: 4,
            ),
          )
        : const SizedBox();
  }

  Widget _buildBackBtn(
    BuildContext context,
    SignUpCoordinator coordinator,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: CrayonBackButton(
        key: const Key('signup_backButton'),
        color: Colors.black,
        onPressed: () {
          coordinator.goBack();
        },
      ),
    );
  }

  Widget _title() {
    return Text(
      widget.signUpArguments.title.tr,
      style: SU_title_style,
    );
  }

  Widget _sub_title(SignUpCoordinator coordinator) {
    return RichTextDescription(
      key: const Key('SU_SubTitle'),
      description: widget.signUpArguments.subTitle,
      linkTextStyle: SU_subtitle_terms_style,
      descriptionTextStyle: SU_subtitle_style,
      onLinkClicked: (text, link) {
        LauncherUtils.launcherUtilsInstance
            .launchInBrowser(url: y9TermsCondition);
      },
    );
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      SignUpCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            label,
            coordinator,
          );
        },
        child: InputFieldWithLabel(
          label: label.tr,
          hintText: hint.tr,
          controller: controller,
          errorText: errorText.tr,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: textInputType == TextInputType.number
              ? [
                  NIDAInputFormatter(
                      mask: 'xxxxxxxx-xxxxx-xxxxx-xx', separator: '-')
                ]
              :
          //[],
            [
              FilteringTextInputFormatter(new RegExp(r"\s\b|\b\s"), allow: false),
              LengthLimitingTextInputFormatter(12),
            ],
          onChanged: (value) {
            _validateForm(coordinator);
            if (nidaNumberError.isNotEmpty || nidaNumber.text.length > 23) {
              coordinator.isValidNidaNumber(nidaNumber.text);
            }
            if (agentIdError.isNotEmpty) {
              coordinator.isValidAgentId(agentId.text);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLabelTextFieldMobNumber(
      String label,
      TextEditingController controller,
      SignUpCoordinator coordinator,
      String hint) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            label,
            coordinator,
          );
        },
        child: InputNumberFieldWithLabel(
          label: label.tr,
          controller: controller,
          errorText: mobileNumberError.tr,
          hintText: hint.tr,
          key: const Key('mobileNumberTextField'),
          inputFormatters: <TextInputFormatter>[
            NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' ')
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            _validateForm(coordinator);
            if (mobileNumberError.isNotEmpty || mobileNumber.text.length > 11) {
              coordinator.isValidMobileNumber(mobileNumber.text);
            }
          },
        ),
      ),
    );
    //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //   Text(label, style: SU_label_style),
    //   const SizedBox(
    //     height: 8,
    //   ),
    //   TextField(
    //     key: const Key('idNumberTextField'),
    //     controller: controller,
    //     keyboardType: TextInputType.number,
    //     textAlign: TextAlign.start,
    //     autofocus: false,
    //     showCursor: true,
    //     inputFormatters: <TextInputFormatter>[
    //       FilteringTextInputFormatter.digitsOnly
    //     ],
    //     style: SU_text_input_style,
    //     decoration: InputDecoration(
    //       prefixIcon: SizedBox(
    //         width: 100,
    //         child: Row(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: Image.asset(
    //                 LS_Flag,
    //                 width: 22,
    //                 height: 16,
    //               ),
    //             ),
    //             Text('+255  ', style: SU_text_input_style)
    //           ],
    //         ),
    //       ),
    //       border: const OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //           borderSide: BorderSide(color: config_color.SU_border_color)),
    //     ),
    //     onChanged: (value) {
    //       _validateForm(coordinator);
    //     },
    //   ),
    // ]
    //   );
  }

  //
  // Widget _carrierText() {
  //   return Text(
  //     'SU_carrier_message'.tr,
  //     style: SU_carrier_message_style,
  //   );
  // }

  Widget _buildContinueButton(
    BuildContext context,
    SignUpCoordinator coordinator,
    SignUpState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if (_isBtnEnabled) {
            coordinator.isValidNidaNumber(nidaNumber.text);
            coordinator.isValidMobileNumber(mobileNumber.text);
            coordinator.isValidAgentId(agentId.text);
            coordinator.isValidPaymentMode(paymentMode.text);
            if (_isBtnEnabled &&
                coordinator.isValidNidaNumber(nidaNumber.text)) {
              coordinator.signup(widget.signUpArguments, mobileNumber.text,
                  nidaNumber.text, agentId.text);
            }
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isBtnEnabled
                  ? config_color.SU_button_color
                  : config_color.SU_grey_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_button_text'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipOtpButton(
      BuildContext context,
      SignUpCoordinator coordinator,
      SignUpState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          // if (_isBtnEnabled) {
          //   coordinator.isValidNidaNumber(nidaNumber.text);
          //   coordinator.isValidMobileNumber(mobileNumber.text);
          //   coordinator.isValidAgentId(agentId.text);
          //   if (_isBtnEnabled &&
          //       coordinator.isValidNidaNumber(nidaNumber.text)) {
          //     coordinator.signup(widget.signUpArguments, mobileNumber.text,
          //         nidaNumber.text, agentId.text);
          //   }
          // }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1,color: _isBtnEnabled ? config_color.PRIMARY_COLOR : config_color.SU_grey_color )
          ),
          child: Center(
            child: Text(
              'SU_skip_otp_verification'.tr,
              style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: _isBtnEnabled ? config_color.PRIMARY_COLOR : config_color.SU_grey_color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentModeDropdown(SignUpCoordinator coordinator) {
    return
      widget.signUpArguments.signupType == SignupType.resetPasscodeAgent ||  widget.signUpArguments.signupType == SignupType.agentSignUp?
        SizedBox():
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonDropDown(
          title: 'SU_telco_partner'.tr,
          key: const Key('telcoDropDown'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ES_grey_button_color,
          ),
          hint: Text(
            'SU_select_telco'.tr,
          ),
          boxHeight: 60,
          error: paymentModeError,
          value: _paymentMode,
          items: paymentModeDropDowm,
          onChanged: (value) async {
            onPaymentModeChoosen(value as Datum, coordinator);
            paymentMode.text = value.name!;
            coordinator.isValidPaymentMode(value.name!);
            print('&&&&&&&&&&&');
            _validateForm(coordinator);
          },
        ),
        const SizedBox(
          height: 6,
        ),
        Text(paymentModeError.tr, style: label_input_error_style),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  List<DropdownMenuItem<Datum>> getPaymentModeDropDownData(
      List<Datum> paymentModel,
      ) {
    for (var item in paymentModel) {
      paymentModeDropDowm.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            item.name.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'brown',
            ),
          ),
        ),
      );
    }
    return paymentModeDropDowm;
  }

  void onPaymentModeChoosen(
      Datum value,
      SignUpCoordinator coordinator,
      ) {
    coordinator.setPaymentMode(value);
  }

  void _listenToStateChanges(BuildContext context, SignUpState state) {
    state.maybeWhen(
        SignUpFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        nindaNumberError: (message) {
          nidaNumberError = message;
        },
        mobileNumberError: (message) {
          mobileNumberError = message;
        },
        agentIdError: (message) {
          agentIdError = message;
        },
        paymentModeError: (message){
          paymentModeError = message;
        },
        onPaymentModeChoosen: (value){
          _paymentMode = value;
        },
        orElse: () => null);
  }




  void _validateForm(SignUpCoordinator coordinator) {
    coordinator.validateForm(nidaNumber.text, mobileNumber.text, agentId.text,
        widget.signUpArguments, agentType, paymentMode.text);
  }

  void _checkValid(String label, SignUpCoordinator coordinator) {
    switch (label) {
      case 'SU_ID_no_label':
        if (nidaNumberError.isNotEmpty || nidaNumber.text.isNotEmpty == true) {
          coordinator.isValidNidaNumber(nidaNumber.text);
        }
        break;
      case 'SU_mobile_no_label':
        if (mobileNumberError.isNotEmpty ||
            mobileNumber.text.isNotEmpty == true) {
          print("ffg");
          coordinator.isValidMobileNumber(mobileNumber.text);
        }
        break;
      case 'SU_agent_id_hint':
        if (agentIdError.isNotEmpty) {
          coordinator.isValidAgentId(agentId.text);
        }
        break;
    }
  }
}
