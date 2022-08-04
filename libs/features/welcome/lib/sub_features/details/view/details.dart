import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/dropdown/crayon_drop_down.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:config/Colors.dart' as config_color;

import '../../../data_model/district.dart';
import '../../../data_model/gender_type.dart';

class DetailsScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/details';
  final String userType;

  const DetailsScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isBtnEnabled = false;
  String nameError = '';
  String emailError = '';
  String poBoxError = '';
  String dobError = '';
  String genderError = '';
  String professionError = '';
  String addressError = '';
  String regionError = '';
  String districtError = '';

  List<DropdownMenuItem<GenderType>> genderTypeDropDown = [];
  List<DropdownMenuItem<Datum>> regionDropDown = [];
  List<DropdownMenuItem<b.Datum>> districtDropDown = [];

  GenderType? _genderType;
  Datum? _region;
  b.Datum? _district;
  List<b.Datum> dis = [];

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
        helpText: 'Select Date of Birth',
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: PRIMARY_COLOR, // header background color
                onPrimary: SU_button_text_color, // header text color
                onSurface: SECONDARY_COLOR, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: SECONDARY_COLOR, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
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
        setupViewModel: (coordinator) async {
          coordinator.getMobileNumber();
          List<Datum> regions = await coordinator.getRegion();
          genderTypeDropDown = getDropDownData(coordinator.genderType);
          regionDropDown = getRegionDropDownData(regions);
        },
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
        currentStep: 3,
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
          _buildLabelTextField('DV_name_label'.tr, name, TextInputType.text,
              coordinator, nameError, 'DV_name_hint_text', true),
          _buildLabelTextFieldDob('DV_dob_label'.tr, dob, coordinator),
          _buildGenderTypeDropdown(coordinator),
          _buildLabelTextField(
              'DV_profession_label'.tr,
              profession,
              TextInputType.name,
              coordinator,
              professionError,
              'DV_profession_hint_text',
              true),
          _buildLabelTextField(
              'DV_contact_no_label'.tr,
              mobileNumber,
              TextInputType.number,
              coordinator,
              '',
              'Enter Your Mobile Number',
              false),
          _buildLabelTextField(
              'DV_email_label'.tr,
              emailId,
              TextInputType.emailAddress,
              coordinator,
              emailError,
              'DV_email_hint_text',
              true),
          _buildLabelTextFieldAddress('DV_address_label'.tr, address,
              coordinator, 'DV_address_hint_text'),
          _buildLabelTextField('DV_po_box_label'.tr, poBox, TextInputType.text,
              coordinator, poBoxError, 'DV_poBox_hint_text', true),
          // _buildLabelTextField(
          //     'DV_region_label'.tr, region, TextInputType.name, coordinator,regionError,'DV_region_hint_text', true),
          _buildRegionDropdown(coordinator),
          _buildDistrictDropdown(coordinator),
          // _buildLabelTextField('DV_district_label'.tr, district,
          //     TextInputType.name, coordinator,districtError,'DV_district_hint_text',true ),
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

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      DetailsCoordinator coordinator,
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
            if (errorText.isNotEmpty) {
              coordinator.isValidName(name.text);
              coordinator.isValidEmail(emailId.text);
              coordinator.isValidPoBox(poBox.text);
              coordinator.isValidGender(gender.text);
              coordinator.isValidDistrict(district.text);
              coordinator.isValidRegion(region.text);
              coordinator.isValidProfession(profession.text);
            }
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
            if (dobError.isNotEmpty) {
              coordinator.isValidDob(dob.text);
            }
          },
        ));
  }

  Widget _buildLabelTextFieldAddress(
      String label,
      TextEditingController controller,
      DetailsCoordinator coordinator,
      String hint) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: InputFieldWithLabel(
          label: label,
          maxLines: 2,
          controller: controller,
          errorText: addressError.tr,
          hintText: hint.tr,
          key: const Key('detailsTextFieldAddress'),
          keyboardType: TextInputType.streetAddress,
          onChanged: (value) {
            _validateForm(coordinator);
            if (addressError.isNotEmpty) {
              coordinator.isValidAddress(value);
            }
          },
        ));
  }

  Widget _buildGenderTypeDropdown(DetailsCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonDropDown(
          title: 'DV_gender_label'.tr,
          key: const Key('genderTypeDropDown'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ES_grey_button_color,
          ),
          hint: Text(
            'DV_gender_hint_text'.tr,
          ),
          boxHeight: 60,
          error: genderError,
          value: _genderType,
          items: genderTypeDropDown,
          onChanged: (value) {
            onGenderTypeChosen(value as GenderType, coordinator);
            gender.text = value.gender;
            _validateForm(coordinator);
            coordinator.isValidGender(value.gender);
          },
        ),
        const SizedBox(
          height: 6,
        ),
        Text(genderError.tr, style: label_input_error_style),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildDistrictDropdown(DetailsCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonDropDown(
          title: 'DV_district_label'.tr,
          key: const Key('districtDropDown'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ES_grey_button_color,
          ),
          hint: Text(
            'DV_district_hint_text'.tr,
          ),
          boxHeight: 60,
          error: districtError,
          value: _district,
          items: districtDropDown,
          onChanged: (value) {
            onDistrictChosen(value as b.Datum, coordinator);
            district.text = value.name!;
            _validateForm(coordinator);
            coordinator.isValidDistrict(value.name!);
          },
        ),
        const SizedBox(
          height: 6,
        ),
        Text(districtError.tr, style: label_input_error_style),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildRegionDropdown(DetailsCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonDropDown(
          title: 'DV_region_label'.tr,
          key: const Key('regionDropDown'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ES_grey_button_color,
          ),
          hint: Text(
            'DV_region_hint_text'.tr,
          ),
          boxHeight: 60,
          error: regionError,
          value: _region,
          items: regionDropDown,
          onChanged: (value) async {
            onRegionChosen(value as Datum, coordinator);
            region.text = value.name!;
            dis = await coordinator.getDistrict(value.id!);
            districtDropDown = getDistrictDropDownData(dis);
            _validateForm(coordinator);
            coordinator.isValidRegion(value.name!);
          },
        ),
        const SizedBox(
          height: 6,
        ),
        Text(regionError.tr, style: label_input_error_style),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildContinueButton(DetailsCoordinator coordinator) {
    return GestureDetector(
      onTap: () async {
        coordinator.isValidPoBox(poBox.text);
        coordinator.isValidEmail(emailId.text);
        coordinator.isValidName(name.text);
        coordinator.isValidGender(gender.text);
        coordinator.isValidDistrict(district.text);
        coordinator.isValidRegion(region.text);
        coordinator.isValidProfession(profession.text);
        coordinator.isValidAddress(address.text);
        coordinator.isValidDob(dob.text);
        if (_isBtnEnabled &&
            coordinator.isValidPoBox(poBox.text) &&
            coordinator.isValidEmail(emailId.text) &&
            coordinator.isValidName(name.text)) {
          await coordinator.submitDetails(
              name.text,
              dob.text,
              gender.text,
              address.text,
              profession.text,
              emailId.text,
              poBox.text,
              region.text,
              district.text,
              widget.userType);
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

  List<DropdownMenuItem<GenderType>> getDropDownData(
    List<GenderType> genderType,
  ) {
    for (var item in genderType) {
      genderTypeDropDown.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            item.gender.toString(),
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
    return genderTypeDropDown;
  }

  List<DropdownMenuItem<Datum>> getRegionDropDownData(
    List<Datum> region,
  ) {
    for (var item in region) {
      regionDropDown.add(
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
    return regionDropDown;
  }

  List<DropdownMenuItem<b.Datum>> getDistrictDropDownData(
    List<b.Datum> district,
  ) {
    for (var item in district) {
      districtDropDown.add(
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
    return districtDropDown;
  }

  void onGenderTypeChosen(
    GenderType value,
    DetailsCoordinator coordinator,
  ) {
    coordinator.setGenderType(value);
  }

  void onRegionChosen(
    Datum value,
    DetailsCoordinator coordinator,
  ) {
    coordinator.setRegion(value);
  }

  void onDistrictChosen(
    b.Datum value,
    DetailsCoordinator coordinator,
  ) {
    coordinator.setDistrict(value);
  }

  void _listenToStateChanges(BuildContext context, DetailsState state) {
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
        poBoxError: (message) {
          poBoxError = message;
        },
        dobError: (message) {
          dobError = message;
        },
        addressError: (message) {
          addressError = message;
        },
        districtError: (message) {
          districtError = message;
        },
        genderError: (message) {
          genderError = message;
        },
        professionError: (message) {
          professionError = message;
        },
        regionError: (message) {
          regionError = message;
        },
        getMobileNumber: (value) {
          mobileNumber.text = value;
        },
        onGenderTypeChoosen: (value) {
          _genderType = value;
        },
        onRegionChoosen: (value) {
          _region = value;
        },
        onDistrictChoosen: (value) {
          _district = value;
        },
        orElse: () => null);
  }

  void _validateForm(DetailsCoordinator coordinator) {
    coordinator.validateForm(
        name.text,
        dob.text,
        _genderType.toString(),
        profession.text,
        mobileNumber.text,
        emailId.text,
        address.text,
        poBox.text,
        region.text,
        district.text);
  }
}
