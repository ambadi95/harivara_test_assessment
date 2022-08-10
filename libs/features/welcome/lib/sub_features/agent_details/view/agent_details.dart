import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/data.dart';
import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';
import 'package:welcome/sub_features/agent_details/viewmodel/agent_details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../../data_model/agent_detail_arguments.dart';
import '../state/agent_details_state.dart';

class AgentDetailsScreen extends StatefulWidget {
  AgentDetailScreenArguments agentDetailScreenArguments;
  static const viewPath = '${WelcomeModule.moduleIdentifier}/agentDetails';

  AgentDetailsScreen({Key? key, required this.agentDetailScreenArguments})
      : super(key: key);

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  bool _isBtnEnabled = false;
  String nameError = '';
  String emailError = '';
  String dobError = '';
  String genderError = '';
  String mobileError = '';
  Data? agentDetails;

  final FocusNode? focusNode = FocusNode();
  final TextEditingController name = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController emailId = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
      setState(() {
        selectedDate = picked;
        var selected = inputFormat.parse(selectedDate.toString());
        var formatedDate = DateFormat('dd/MM/yyyy');
        dob.text = formatedDate.format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<AgentDetailsCoordinator, AgentDetailsState>(
        onStateListenCallback: (preState, newState) =>
            {_listenToStateChanges(context, newState)},
        setupViewModel: (coordinator) async {
          agentDetails = await coordinator.getAgentDetail();
          name.text = agentDetails!.firstName! + ' ' + agentDetails!.lastName!;
          mobileNumber.text = agentDetails!.mobileNo!;
          emailId.text = agentDetails!.emailId!;
          gender.text = agentDetails!.gender!;
          dob.text = agentDetails!.birthDate!.toString();
        },
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
              child: _buildContinueButton(coordinator),
            ),
            appBar: PreferredSize(
              preferredSize: Size(
                  double.infinity,
                  widget.agentDetailScreenArguments.isProgressBarVisible
                      ? 102
                      : 58),
              child: _buildTopContainer(context, coordinator),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMainUI(coordinator),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildTopContainer(
    BuildContext context,
    AgentDetailsCoordinator coordinator,
  ) {
    return Column(
      children: [
        widget.agentDetailScreenArguments.isProgressBarVisible
            ? _onBoardingProgressBar()
            : const SizedBox(),
        _buildBackBtn(context, coordinator),
      ],
    );
  }

  Widget _onBoardingProgressBar() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 0),
      child: OnBoardingProgressBar(
        currentStep: 2,
        totalSteps: 4,
      ),
    );
  }

  Widget _buildBackBtn(
    BuildContext context,
    AgentDetailsCoordinator coordinator,
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

  Widget _buildMainUI(AgentDetailsCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _subtitle(),
          const SizedBox(
            height: 30,
          ),
          _buildLabelTextField('DV_name_label'.tr, name, TextInputType.text,
              coordinator, nameError, 'DV_name_hint_text', false),
          _buildLabelNumberTextField(
              'DV_contact_no_label'.tr,
              mobileNumber,
              TextInputType.number,
              coordinator,
              mobileError,
              'LS_mobile_hint_text',
              false),
          _buildLabelTextField(
              'DV_email_label'.tr,
              emailId,
              TextInputType.emailAddress,
              coordinator,
              emailError,
              'DV_email_hint_text',
              false),
          _buildLabelTextField('DV_gender_label'.tr, gender, TextInputType.name,
              coordinator, genderError, 'DV_gender_hint_text', false),
          _buildLabelTextFieldDob('DV_dob_label'.tr, dob, coordinator),
        ],
      ),
    );
  }

  Widget _title() {
    return CrayonPaymentText(
      key: const Key('DV_title'),
      text: TextUIDataModel(widget.agentDetailScreenArguments.title.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline2,
          color: VO_TitleColor,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _subtitle() {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrayonPaymentText(
            key: const Key('DV_subTitle'),
            text: TextUIDataModel(
              widget.agentDetailScreenArguments.subTitle.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: VO_DescriptionColor,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      AgentDetailsCoordinator coordinator,
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
          keyboardType: textInputType,
          onChanged: (value) {
            _validateForm(coordinator);
          },
        ));
  }

  Widget _buildLabelNumberTextField(
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      AgentDetailsCoordinator coordinator,
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
          key: const Key('detailsTextNumberField'),
          keyboardType: textInputType,
          onChanged: (value) {
            _validateForm(coordinator);
          },
        ));
  }

  Widget _buildLabelTextFieldDob(String label, TextEditingController controller,
      AgentDetailsCoordinator coordinator) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          controller: controller,
          errorText: dobError.tr,
          hintText: 'DV_dob_hint_text'.tr,
          key: const Key('detailsTextFieldDob'),
          keyboardType: TextInputType.none,
          enabled: false,
          onChanged: (value) {
            _validateForm(coordinator);
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_month_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: config_color.SU_border_color)),
          ),
          onTap: () async {
            await _selectDate(context);
          },
        ));
  }

  Widget _buildContinueButton(AgentDetailsCoordinator coordinator) {
    return widget.agentDetailScreenArguments.agentDetailScreenType ==
            AgentDetailScreenType.Signup
        ? GestureDetector(
            onTap: () {
              // coordinator.submitAgentDetail(
              //     agentDetails!.y9AgentId!,
              //     agentDetails!.firstName!,
              //     agentDetails!.lastName!,
              //     agentDetails?.middleName ?? ' ',
              //     agentDetails!.nidaNo!,
              //     agentDetails?.birthdate,
              //     agentDetails!.gender!,
              //     agentDetails!.mobileNo!,
              //     agentDetails!.emailId!);
              coordinator.navigateToOtpScreen(mobileNumber.text, name.text);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: config_color.SU_button_color,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  'SU_button_text'.tr,
                  style: SU_button_text_style,
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  void _listenToStateChanges(BuildContext context, AgentDetailsState state) {
    state.maybeWhen(
        DetailsFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        emailError: (message) {
          emailError = message;
        },
        nameError: (message) {
          nameError = message;
        },
        dobError: (message) {
          dobError = message;
        },
        genderError: (message) {
          genderError = message;
        },
        mobileError: (message) {
          mobileError = message;
        },
        orElse: () => null);
  }

  void _validateForm(AgentDetailsCoordinator coordinator) {
    coordinator.validateForm(
      name.text,
      dob.text,
      gender.text,
      mobileNumber.text,
      emailId.text,
    );
  }
}
