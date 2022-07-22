import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:config/Colors.dart' as config_color;

class DetailsScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isBtnEnabled = false;
  final FocusNode? focusNode = FocusNode();
  final TextEditingController name = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController profession = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController poBox = TextEditingController();
  final TextEditingController region = TextEditingController();
  final TextEditingController district = TextEditingController();

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
      BaseView<DetailsCoordinator, DetailsState>(
        onStateListenCallback: (preState, newState) =>
            {_listenToStateChanges(context, newState)},
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
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
    DetailsCoordinator coordinator,
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
    DetailsCoordinator coordinator,
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

  Widget _buildMainUI(DetailsCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(
            height: 30,
          ),
          _buildLabelTextField(
              'DV_name_label'.tr, name, TextInputType.text, coordinator),
          _buildLabelTextFieldDob('DV_dob_label'.tr, dob, coordinator),
          _buildLabelTextField(
              'DV_gender_label'.tr, gender, TextInputType.name, coordinator),
          _buildLabelTextField('DV_profession_label'.tr, profession,
              TextInputType.name, coordinator),
          _buildLabelTextField('DV_contact_no_label'.tr, mobileNumber,
              TextInputType.number, coordinator),
          _buildLabelTextField('DV_email_label'.tr, emailId,
              TextInputType.emailAddress, coordinator),
          _buildLabelTextFieldAddress(
              'DV_address_label'.tr, address, coordinator),
          _buildLabelTextField(
              'DV_po_box_label'.tr, poBox, TextInputType.text, coordinator),
          _buildLabelTextField(
              'DV_region_label'.tr, region, TextInputType.name, coordinator),
          _buildLabelTextField('DV_district_label'.tr, district,
              TextInputType.name, coordinator),
          _buildContinueButton(coordinator)
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      'DV_title'.tr,
      style: SU_title_style,
    );
  }

  Widget _buildLabelTextField(String label, TextEditingController controller,
      TextInputType textInputType, DetailsCoordinator coordinator) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          controller: controller,
          errorText: '',
          key: const Key('detailsTextField'),
          keyboardType: textInputType,
          onChanged: (value) {
            _validateForm(coordinator);
          },
        ));
  }

  Widget _buildLabelTextFieldDob(String label, TextEditingController controller,
      DetailsCoordinator coordinator) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          controller: controller,
          errorText: '',
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
          onTap: () {
            _selectDate(context);
          },
        ));
  }

  Widget _buildLabelTextFieldAddress(String label,
      TextEditingController controller, DetailsCoordinator coordinator) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          maxLines: 2,
          controller: controller,
          errorText: '',
          key: const Key('detailsTextFieldAddress'),
          keyboardType: TextInputType.streetAddress,
          onChanged: (value) {
            _validateForm(coordinator);
          },
        ));
  }

  Widget _buildContinueButton(DetailsCoordinator coordinator) {
    return GestureDetector(
      onTap: () {
        if (_isBtnEnabled) {
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

  void _listenToStateChanges(BuildContext context, DetailsState state) {
    state.maybeWhen(
        DetailsFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        orElse: () => null);
  }

  void _validateForm(DetailsCoordinator coordinator) {
    coordinator.validateForm(
        name.text,
        dob.text,
        gender.text,
        profession.text,
        mobileNumber.text,
        emailId.text,
        address.text,
        poBox.text,
        region.text,
        district.text);
  }
}
