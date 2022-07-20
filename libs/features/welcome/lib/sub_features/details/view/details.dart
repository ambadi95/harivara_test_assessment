import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
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
        firstDate: DateTime(2015, 8),
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
  Widget build(BuildContext context) =>BaseView<DetailsCoordinator, DetailsState>(
    setupViewModel: (coordinator) async {
    },
    builder: (context, state, coordinator) => SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 102),
          child: _buildTopContainer(context,coordinator),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainUI(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildTopContainer( BuildContext context,
      DetailsCoordinator coordinator,){
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

  Widget _buildMainUI(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(height: 30,),
          _buildLabelTextField('DV_name_label'.tr , name, TextInputType.text),
          _buildLabelTextFieldDob('DV_dob_label'.tr , dob),
          _buildLabelTextField('DV_gender_label'.tr , gender,TextInputType.name),
          _buildLabelTextField('DV_profession_label'.tr , profession, TextInputType.name),
          _buildLabelTextField('DV_contact_no_label'.tr , mobileNumber,TextInputType.number),
          _buildLabelTextField('DV_email_label'.tr , emailId, TextInputType.emailAddress),
          _buildLabelTextFieldAddress('DV_address_label'.tr , address),
          _buildLabelTextField('DV_po_box_label'.tr , poBox, TextInputType.text),
          _buildLabelTextField('DV_region_label'.tr , region, TextInputType.name),
          _buildLabelTextField('DV_district_label'.tr , district, TextInputType.name),
          _buildContinueButton()
        ],
      ),
    );
  }

  Widget _title(){
    return Text('DV_title'.tr,
      style: SU_title_style,
    );
  }

  Widget _buildLabelTextField(String label, TextEditingController controller, TextInputType textInputType){
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: SU_label_style),
            const SizedBox(height: 8,),
            TextField(
                key: const Key('detailsTextField'),
                controller: controller,
                keyboardType: textInputType,
                textAlign: TextAlign.start,
                autofocus: false,
                showCursor: true,
                style: SU_text_input_style,
                decoration: SU_text_input_border_style,
            ),
          ]
      ),
    );
  }

  Widget _buildLabelTextFieldDob(String label, TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: SU_label_style),
            const SizedBox(height: 8,),
            TextField(
                key: const Key('idNumberTextField'),
                controller: controller,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.start,
                autofocus: false,
                showCursor: true,
                style: SU_text_input_style,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: (){
                      _selectDate(context);
                    },
                      child: const Icon(Icons.calendar_month_outlined)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide:  BorderSide(color: config_color.SU_border_color)
                  ),
            ),
            )
          ]
      ),
    );
  }

  Widget _buildLabelTextFieldAddress(String label, TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: SU_label_style),
            const SizedBox(height: 8,),
            SizedBox(
              height: 80,
              child: TextField(
                maxLines: 2,
                key: const Key('detailsTextField'),
                controller: controller,
                keyboardType: TextInputType.streetAddress,
                textAlign: TextAlign.start,
                autofocus: false,
                showCursor: true,
                style: SU_text_input_style,
                decoration: SU_text_input_address_style,
              ),
            ),
          ]
      ),
    );
  }

  Widget _buildContinueButton(
      ) {
    return GestureDetector(
      onTap: (){
        // welcomeCoordinator.navigateToSignUpScreen();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color:  config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: Text('SU_button_text'.tr, style: SU_button_text_style,),
        ),
      ),
    );
  }

}

