import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../state/agent_details_state.dart';

class AgentDetailsScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/agentDetails';

  const AgentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  bool _isBtnEnabled = false;
  String nameError = '';
  String emailError = '';
  String dobError ='';
  String genderError ='';

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
          coordinator.getMobileNumber();
        },
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 18),
              child: _buildContinueButton(coordinator),
            ),
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 102),
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
        _onBoardingProgressBar(),
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
          _buildLabelTextField(
              'DV_name_label'.tr, name, TextInputType.text, coordinator,nameError,'DV_name_hint_text', true),
          _buildLabelTextField('DV_contact_no_label'.tr, mobileNumber,
              TextInputType.number, coordinator,'','Enter Your Mobile Number', true),
          _buildLabelTextField('DV_email_label'.tr, emailId,
              TextInputType.emailAddress, coordinator,emailError,'DV_email_hint_text', true),
          _buildLabelTextField(
              'DV_gender_label'.tr, gender, TextInputType.name, coordinator,genderError,'DV_gender_hint_text', true),
          _buildLabelTextFieldDob('DV_dob_label'.tr, dob, coordinator),
        ],
      ),
    );
  }

  Widget _title() {
    return CrayonPaymentText(
      key: const Key('DV_title'),
      text: TextUIDataModel(
        'DV_title'.tr,
        styleVariant: CrayonPaymentTextStyleVariant.headline2,
        color: VO_TitleColor,
        textAlign: TextAlign.left,
      ),
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
              'DV_subtitle'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: VO_DescriptionColor,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelTextField(String label, TextEditingController controller,
      TextInputType textInputType, AgentDetailsCoordinator coordinator, String errorText, String hint, bool enabled) {
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
            if(errorText.isNotEmpty){
              coordinator.isValidName(name.text);
              coordinator.isValidEmail(emailId.text);
            }
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
            if(dobError.isNotEmpty){
              coordinator.isValidDob(dob.text);
            }
          },
        ));
  }



  Widget _buildContinueButton(AgentDetailsCoordinator coordinator) {
    return GestureDetector(
      onTap: () {
        coordinator.isValidEmail(emailId.text);
        coordinator.isValidName(name.text);
        coordinator.isValidGender(gender.text);
        coordinator.isValidDob(dob.text);
        if (_isBtnEnabled && coordinator.isValidEmail(emailId.text) &&coordinator.isValidName(name.text) ) {
          coordinator.navigateToCreatePasscodeScreen();
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
    );
  }

  void _listenToStateChanges(BuildContext context, AgentDetailsState state) {
    state.maybeWhen(
        DetailsFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        emailError: (message){
          emailError = message;
        },
        nameError: (message){
          nameError = message;
        },

        dobError: (message){
          dobError = message;
        },
        genderError: (message){
          genderError = message;
        },
        getMobileNumber: (value){

        },
        orElse: () => null);
  }

  void _validateForm(AgentDetailsCoordinator coordinator) {
    coordinator.validateForm(
        name.text,
        dob.text,
        gender.text,
        mobileNumber.text,
        emailId.text,);
  }
}
