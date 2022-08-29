import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:get/get.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../../../../../data_model/sign_up_arguments.dart';
import '../state/onboarding_approval_state.dart';
import '../viewmodel/customer_onboarding_approval_coordinator.dart';

class CustomerOnBoardingApproval extends StatefulWidget {
  final SignUpArguments signUpArguments;
  static const viewPath =
      '${WelcomeModule.moduleIdentifier}/customerOnBoardingApproval';

  const CustomerOnBoardingApproval({required this.signUpArguments, Key? key})
      : super(key: key);

  @override
  State<CustomerOnBoardingApproval> createState() => _SignUpState();
}

class _SignUpState extends State<CustomerOnBoardingApproval> {
  bool _isBtnEnabled = false;
  String mobileNumberError = '';
  TextEditingController referenceID = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BaseView<CustomerOnBoardingApprovalCoordinator, OnBoardingApprovalState>(
        onStateListenCallback: (preState, newState) => {
          //_listenToStateChanges(context, newState)
        },
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            bottomNavigationBar: SizedBox(
              height: 120,
              child: Column(
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  _buildContinueButton(context, coordinator, state)
                ],
              ),
            ),
            body: SingleChildScrollView(
                child: SafeArea(
              child: _UI(coordinator, state),
            )),
          ),
        ),
      );

  Widget _UI(CustomerOnBoardingApprovalCoordinator coordinator,
      OnBoardingApprovalState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopContainer(context, coordinator),
        _buildMainUI(coordinator, state),
      ],
    );
  }

  Widget _buildMainUIWithLoading(
      BuildContext context,
      CustomerOnBoardingApprovalCoordinator coordinator,
      OnBoardingApprovalState state) {
    return Stack(
      children: [
        _UI(coordinator, state),
        _createLoading(),
      ],
    );
  }

  Widget _buildTopContainer(
    BuildContext context,
    CustomerOnBoardingApprovalCoordinator coordinator,
  ) {
    return Column(
      children: [
        widget.signUpArguments.signupType ==
                SignupType.agentAidedCustomerOnBoarding
            ? const SizedBox()
            : _onBoardingProgressBar(),
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

  Widget _buildMainUI(CustomerOnBoardingApprovalCoordinator coordinator,
      OnBoardingApprovalState state) {
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
            height: 94,
          ),
          _buildLabelTextField(
              'PC_customer_ref_id',
              referenceID,
              coordinator,
              'PC_customer_ref_id_hint',
              state.referenceIdError,
              TextInputType.number),
          const SizedBox(
            height: 64,
          ),
          _buildLabelTextFieldMobNumber(
              'SU_mobile_no_label',
              state.mobileNumberError,
              mobileNumber,
              coordinator,
              'SU_subtitle_hint')
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
    CustomerOnBoardingApprovalCoordinator coordinator,
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

  Widget _sub_title(CustomerOnBoardingApprovalCoordinator coordinator) {
    return RichTextDescription(
      key: const Key('SU_SubTitle'),
      description: widget.signUpArguments.subTitle,
      linkTextStyle: SU_subtitle_terms_style,
      descriptionTextStyle: SU_subtitle_style,
      onLinkClicked: (text, link) {
        coordinator.navigateToTermsCondition();
      },
    );
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      CustomerOnBoardingApprovalCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {},
        child: InputFieldWithLabel(
          label: label.tr,
          hintText: hint.tr,
          controller: controller,
          errorText: errorText.tr,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
            coordinator.validateReferenceId(value);
            _validateForm(coordinator);
          },
        ),
      ),
    );
  }

  Widget _buildLabelTextFieldMobNumber(
      String label,
      String errorText,
      TextEditingController controller,
      CustomerOnBoardingApprovalCoordinator coordinator,
      String hint) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          // _checkValid(
          //   label,
          //   coordinator,
          // );
        },
        child: InputNumberFieldWithLabel(
          label: label.tr,
          controller: controller,
          errorText: errorText.tr,
          hintText: hint.tr,
          key: const Key('mobileNumberTextField'),
          inputFormatters: <TextInputFormatter>[
            NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' ')
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (mobileNumberError.isNotEmpty || mobileNumber.text.length > 11) {
              coordinator.validateMobileNumber(mobileNumber.text);
            }
            _validateForm(coordinator);
          },
        ),
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    CustomerOnBoardingApprovalCoordinator coordinator,
    OnBoardingApprovalState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          coordinator.getCustomerDetails(mobileNumber.text, referenceID.text);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: state.isValid
                  ? config_color.SU_button_color
                  : config_color.SU_grey_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'PC_fetch_details'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm(CustomerOnBoardingApprovalCoordinator coordinator) {
    coordinator.validateForm(mobileNumber.text, referenceID.text);
  }
}
