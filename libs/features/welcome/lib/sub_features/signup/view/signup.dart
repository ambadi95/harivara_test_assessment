import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  final String userType;
  static const viewPath = '${WelcomeModule.moduleIdentifier}/signup';

  const SignUp({required this.userType, Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isBtnEnabled = false;
  String nidaNumberError = '';
  String mobileNumberError = '';
  String agentIdError = '';
  TextEditingController nidaNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController agentId = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BaseView<SignUpCoordinator, SignUpState>(
        onStateListenCallback: (preState, newState) =>
            {_listenToStateChanges(context, newState)},
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => Scaffold(
          bottomNavigationBar: SizedBox(
            height: 120,
            child: Column(
              children: [
                _carrierText(),
                const SizedBox(
                  height: 23,
                ),
                _buildContinueButton(context, coordinator, state)
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopContainer(context, coordinator),
                  _buildMainUI(coordinator),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildTopContainer(
    BuildContext context,
    SignUpCoordinator coordinator,
  ) {
    return Column(
      children: [
        _onBoardingProgressBar(),
        _buildBackBtn(context, coordinator),
      ],
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
          _sub_title(),
          const SizedBox(
            height: 69,
          ),
          _buildLabelTextField('SU_ID_no_label'.tr, nidaNumber, coordinator,
              'SU_title_hint', nidaNumberError, TextInputType.number),
          const SizedBox(
            height: 48,
          ),
          widget.userType == 'Customer'
              ? _buildLabelTextFieldMobNumber(
                  'SU_mobile_no_label'.tr, mobileNumber, coordinator)
              : _buildLabelTextField('SU_agent_id_hint'.tr, agentId,
                  coordinator, 'SU_agent_id_hint', agentIdError, TextInputType.text),
        ],
      ),
    );
  }

  Widget _onBoardingProgressBar() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 0),
      child: OnBoardingProgressBar(
        currentStep: 1,
        totalSteps: 4,
      ),
    );
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
      'SU_title'.tr,
      style: SU_title_style,
    );
  }

  Widget _sub_title() {
    return RichTextDescription(
        key: const Key('SU_SubTitle'),
        description: 'SU_subtitle'.tr,
        linkTextStyle: SU_subtitle_terms_style,
        descriptionTextStyle: SU_subtitle_style);
  }

  Widget _buildLabelTextField(String label, TextEditingController controller,
      SignUpCoordinator coordinator, String hint, String errorText, TextInputType textInputType) {
    return InputFieldWithLabel(
      label: label,
      hintText: hint.tr,
      controller: controller,
      errorText: errorText.tr,
      keyboardType: textInputType,
      inputFormatters: textInputType == TextInputType.number ? [
        NIDAInputFormatter(mask: 'xxxxxxxx-xxxxx-xxxxx-xx',separator: '-')
      ] : [],
      onChanged: (value) {
        _validateForm(coordinator);
        if (nidaNumberError.isNotEmpty || nidaNumber.text.length > 23) {
          coordinator.isValidNidaNumber(nidaNumber.text);
        }
        if(agentIdError.isNotEmpty){
          coordinator.isValidAgentId(agentId.text);
        }
      },
    );
  }

  Widget _buildLabelTextFieldMobNumber(String label,
      TextEditingController controller, SignUpCoordinator coordinator) {
    return InputNumberFieldWithLabel(
      label: label,
      controller: controller,
      errorText: mobileNumberError.tr,
      hintText: 'SU_subtitle_hint'.tr,
      key: const Key('mobileNumberTextField'),
      inputFormatters: <TextInputFormatter>[
        NIDAInputFormatter(mask: 'xxx xxx xxx',separator: ' ')
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _validateForm(coordinator);
        if (mobileNumberError.isNotEmpty || mobileNumber.text.length > 11) {
          coordinator.isValidMobileNumber(mobileNumber.text);
        }
      },
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

  Widget _carrierText() {
    return Text(
      'SU_carrier_message'.tr,
      style: SU_carrier_message_style,
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    SignUpCoordinator coordinator,
    SignUpState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          coordinator.isValidNidaNumber(nidaNumber.text);
          coordinator.isValidMobileNumber(mobileNumber.text);
          coordinator.isValidAgentId(agentId.text);
          if (_isBtnEnabled && coordinator.isValidNidaNumber(nidaNumber.text)) {
            coordinator.navigateDestination(widget.userType);
            await coordinator.continueToOtp(nidaNumber.text, mobileNumber.text);
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
        orElse: () => null);
  }

  void _validateForm(SignUpCoordinator coordinator) {
    coordinator.validateForm(
        nidaNumber.text, mobileNumber.text, agentId.text, widget.userType);
  }
}
