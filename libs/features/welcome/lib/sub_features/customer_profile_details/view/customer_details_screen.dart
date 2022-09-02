import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:welcome/data_model/details_arguments.dart';
import 'package:welcome/sub_features/customer_profile_details/state/customer_details_state.dart';
import 'package:welcome/sub_features/customer_profile_details/viewmodel/customer_details_coordinator.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/alert_dialogue/crayon_payment_alert_dialogue.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/dropdown/crayon_drop_down.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:config/Colors.dart' as config_color;

import '../../../data_model/gender_type.dart';
import 'package:core/mobile_core.dart';

class CustomerDetailsScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/customerDetails';
  final UserType userType;

  const CustomerDetailsScreen({Key? key, required this.userType})
      : super(key: key);

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
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

  final FocusNode genderFocusNode = FocusNode();

  DateTime selectedDate = DateTime.now();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _selectDate(
      BuildContext context, CustomerDetailsCoordinator coordinator) async {
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
        if (inputFormat
                .parse(DateTime.now().toString())
                .difference(inputFormat.parse(selectedDate.toString()))
                .inDays
                .abs() <
            6575) {
          coordinator.inVaidDob();
        }
        var formatedDate = DateFormat('dd/MM/yyyy');
        dob.text = formatedDate.format(selected);
      });
    }
  }

  GlobalKey<FormState> _abcKey = GlobalKey<FormState>();
  GetCustomerDetailsResponse? customerResponse;

  @override
  Widget build(BuildContext context) =>
      BaseView<CustomerDetailsCoordinator, CustomerDetailsState>(
          onStateListenCallback: (preState, newState) =>
              {_listenToStateChanges(context, newState)},
          setupViewModel: (coordinator) async {
            //   coordinator.getMobileNumber();

            List<Datum> regions = await coordinator.getRegion(widget.userType);
            genderTypeDropDown = getDropDownData(coordinator.genderType);
            regionDropDown = getRegionDropDownData(regions);

            customerResponse = await coordinator.getCustomerDetails();

            String firstName = customerResponse!.data!.firstName ?? "";
            String lastName = customerResponse!.data!.lastName ?? "";
            name.text = firstName + " " + lastName;
            dob.text = customerResponse!.data!.birthdate ?? "";
            gender.text = customerResponse!.data!.gender ?? "";
            profession.text = customerResponse!.data!.profession ?? "";
            mobileNumber.text = customerResponse!.data!.mobileNo ?? "";
            emailId.text = customerResponse!.data!.emailId ?? "";
            address.text = customerResponse!.data!.address ?? "";
            poBox.text = customerResponse!.data!.poBoxNumber ?? "";

            region.text = customerResponse!.data!.region ?? "";

            district.text = customerResponse!.data!.district ?? "";
            for (var element in regions) {
              if (element.name! == region.text) {
                _region = element;
                dis = await coordinator.getDistrict(
                    _region!.id!, widget.userType);
                districtDropDown = getDistrictDropDownData(dis);
                for (var disElement in dis) {
                  if (disElement.name! == district.text) {
                    _district = disElement;
                  }
                }
              }
            }

            setState(() {});
          },
          builder: (context, state, coordinator) => SafeArea(
                child: Scaffold(
                  key: _abcKey,
                  body: customerResponse.isNotEmptyOrNull
                      ? Column(
                          children: [
                            _buildTopContainer(context, coordinator),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildMainUI(context, coordinator),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : _buildMainUIWithLoading(context, coordinator),
                ), /*state.maybeWhen(
                  LoadingState: () =>
                      _buildMainUIWithLoading(context, coordinator),
                  orElse: () => Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size(double.infinity,
                          widget.userType == UserType.AgentCustomer ? 58 : 58),
                      child: _buildTopContainer(context, coordinator),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMainUI(context, coordinator),
                        ],
                      ),
                    ),
                  ),
                ),*/
              ));

  Widget _buildTopContainer(
    BuildContext context,
    CustomerDetailsCoordinator coordinator,
  ) {
    return _buildBackBtn(context, coordinator);
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    CustomerDetailsCoordinator coordinator,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.white,
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
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
    CustomerDetailsCoordinator coordinator,
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

  Widget _buildMainUI(
      BuildContext context, CustomerDetailsCoordinator coordinator) {
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
              'name',
              'DV_name_label'.tr,
              name,
              TextInputType.text,
              coordinator,
              nameError,
              'DV_name_hint_text',
              false),
          _buildLabelTextFieldDob(
            'DV_dob_label'.tr,
            dob,
            coordinator,
            false,
          ),
          //_buildGenderTypeDropdown(coordinator),
          _buildLabelTextField(
              'DV_gender_label'.tr,
              'DV_gender_label'.tr,
              gender,
              TextInputType.name,
              coordinator,
              professionError,
              'DV_profession_hint_text',
              false),
          _buildLabelTextField(
              'profession',
              'DV_profession_label'.tr,
              profession,
              TextInputType.name,
              coordinator,
              professionError,
              'DV_profession_hint_text',
              true),
          _buildLabelTextField(
              'contact',
              'DV_contact_no_label'.tr,
              mobileNumber,
              TextInputType.number,
              coordinator,
              '',
              'Enter Your Mobile Number',
              false),
          _buildLabelTextField(
              'email',
              'DV_email_label'.tr,
              emailId,
              TextInputType.emailAddress,
              coordinator,
              emailError,
              'DV_email_hint_text',
              false),
          _buildLabelTextFieldAddress('DV_address_label'.tr, address,
              coordinator, 'DV_address_hint_text', true),
          _buildLabelTextField(
              'pobox',
              'DV_po_box_label'.tr,
              poBox,
              TextInputType.text,
              coordinator,
              poBoxError,
              'DV_poBox_hint_text',
              true),
          _buildRegionDropdown(coordinator),
          _buildDistrictDropdown(coordinator),
          _buildSaveButton(context, coordinator)
        ],
      ),
    );
  }

  Widget _buildSaveButton(
      BuildContext buildContext, CustomerDetailsCoordinator coordinator) {
    return GestureDetector(
      onTap: () async {
        //  coordinator.isValidName(name.text);
        // _checkDob(coordinator);
        // coordinator.isValidGender(gender.text);
        coordinator.isValidPoBox(poBox.text);
        coordinator.isValidEmail(emailId.text);
        coordinator.isValidDistrict(district.text);
        coordinator.isValidRegion(region.text);
        coordinator.isValidProfession(profession.text);
        coordinator.isValidAddress(address.text);

        if (nameError.tr.isNotEmpty) {
          // _showSnackBar(context,nameError.tr);
          _showAlert(nameError.tr);

          return;
        } else if (dobError.tr.isNotEmpty) {
          _showAlert(dobError.tr);

          return;
        } else if (genderError.tr.isNotEmpty) {
          _showAlert(genderError.tr);

          return;
        } else if (professionError.tr.isNotEmpty) {
          _showAlert(professionError.tr);
          return;
        } else if (emailError.tr.isNotEmpty) {
          _showAlert(emailError.tr);

          return;
        } else if (addressError.tr.isNotEmpty) {
          _showAlert(addressError.tr);

          return;
        } else if (regionError.tr.isNotEmpty) {
          _showAlert(regionError.tr);

          return;
        } else if (districtError.tr.isNotEmpty) {
          _showAlert(districtError.tr);

          return;
        }
        if (coordinator.isValidPoBox(poBox.text) &&
            coordinator.isValidEmail(emailId.text) &&
            coordinator.isValidName(name.text)) {
          AppUtils.appUtilsInstance.removeFocusFromEditText(context: context);
          await coordinator.updateDetails(
              name.text,
              dob.text,
              gender.text,
              address.text,
              district.text,
              emailId.text,
              poBox.text,
              profession.text,
              region.text,
              widget.userType,context);
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            'Save_Text'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile_Title'.tr,
          style: SU_title_style,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Profile_Sub_Title'.tr,
          style: SU_subtitle_style,
        ),
      ],
    );
  }

  Widget _buildLabelTextField(
      String tag,
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      CustomerDetailsCoordinator coordinator,
      String errorText,
      String hint,
      bool enabled) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            tag,
            coordinator,
          );
        },
        canRequestFocus: true,
        child: Padding(
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
            )),
      ),
    );
  }

  Widget _buildLabelTextFieldDob(String label, TextEditingController controller,
      CustomerDetailsCoordinator coordinator, bool enabled) {
    return FocusScope(
      onFocusChange: (focus) {
        /* if (dob.text.isNotEmpty) {
          if (dobError.isNotEmpty) {
            coordinator.isValidDob(dob.text);
          }
          final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
          if (inputFormat
                  .parse(DateTime.now().toString())
                  .difference(inputFormat.parse(selectedDate.toString()))
                  .inDays
                  .abs() <
              6575) {
            coordinator.inVaidDob();
          }
        }*/
      },
      canRequestFocus: true,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 34),
          child: InputFieldWithLabel(
            label: label,
            controller: controller,
            errorText: dobError.tr,
            hintText: 'DV_dob_hint_text'.tr,
            enabled: enabled,
            key: const Key('detailsTextFieldDob'),
            keyboardType: TextInputType.none,
            onChanged: (value) {
              //  _validateForm(coordinator);
            },
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.calendar_month_outlined),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: config_color.SU_border_color)),
            ),
            onTap: () async {
              /* if (dobError.isNotEmpty) {
                coordinator.isValidDob(dob.text);
              }
              await _selectDate(context, coordinator);*/
            },
          )),
    );
  }

  Widget _buildLabelTextFieldAddress(
      String label,
      TextEditingController controller,
      CustomerDetailsCoordinator coordinator,
      String hint,
      bool enabled) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          if (controller.text.trim().toString().isNotEmpty) {
            coordinator.isValidAddress(controller.text.trim().toString());
          }
        },
        child: Padding(
            padding: const EdgeInsets.only(bottom: 34),
            child: InputFieldWithLabel(
              label: label,
              maxLines: 2,
              controller: controller,
              errorText: addressError.tr,
              hintText: hint.tr,
              enabled: enabled,
              key: const Key('detailsTextFieldAddress'),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) {
                _validateForm(coordinator);
                if (addressError.isNotEmpty) {
                  coordinator.isValidAddress(value);
                }
              },
            )),
      ),
    );
  }

  Widget _buildRegionDropdown(CustomerDetailsCoordinator coordinator) {
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
            _region.isEmptyOrNull ? 'DV_region_hint_text'.tr : _region!.name!,
          ),
          boxHeight: 60,
          isDense: false,
          error: regionError,
          value: _region,
          items: regionDropDown,
          onChanged: (value) async {
            onRegionChosen(value as Datum, coordinator);
            region.text = value.name!;
            _validateForm(coordinator);
            coordinator.isValidRegion(value.name!);
            dis.clear();
            district.clear();
            AppUtils.appUtilsInstance.showCircularDialog(context);
            dis = await coordinator.getDistrict(value.id!, widget.userType);
            Navigator.pop(context);
            districtDropDown.clear();
            districtDropDown = getDistrictDropDownData(dis);
            _district = districtDropDown.elementAt(0).value;
            setState(() {

            });
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

  Widget _buildGenderTypeDropdown(CustomerDetailsCoordinator coordinator) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {},
        child: Column(
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
        ),
      ),
    );
  }

  Widget _buildDistrictDropdown(CustomerDetailsCoordinator coordinator) {
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
            _district.isEmptyOrNull
                ? 'DV_district_hint_text'.tr
                : _district!.name!,
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

  void _showAlert(String errorMessage) {
    CrayonPaymentAlertDialogue.showMaterialAlert(
        context: context,
        title: "Alert!",
        content: errorMessage,
        defaultActionText: "Close");
  }

  void _showSnackBar(BuildContext context, String errorMessage) {
    final showMessage = ScaffoldMessenger.of(context);
    showMessage.showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR,
        key: Key('Detail_Screen_Error_SnackBar'),
        content: Text(
          errorMessage,
          key: Key('Text'),
          style: label_input_error_white_style,
        ),
        duration: Duration(seconds: 4),
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
    CustomerDetailsCoordinator coordinator,
  ) {
    coordinator.setGenderType(value);
  }

  void onRegionChosen(
    Datum value,
    CustomerDetailsCoordinator coordinator,
  ) {
    coordinator.setRegion(value);
  }

  void onDistrictChosen(
    b.Datum value,
    CustomerDetailsCoordinator coordinator,
  ) {
    coordinator.setDistrict(value);
  }

  void _listenToStateChanges(BuildContext context, CustomerDetailsState state) {
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
        /*  getRegion: (regionValue) {
          var item = regionDropDown.firstWhereOrNull(
            (
              element,
            ) =>
                element.value != null && element.value!.name == regionValue,
          );
          if (item != null) {
            _region = item.value;
          }
        },*/
        orElse: () => null);
  }

  void _validateForm(CustomerDetailsCoordinator coordinator) {
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

  void _checkValid(String label, CustomerDetailsCoordinator coordinator) {
    print(label);
    switch (label) {
      case 'name':
        if (name.text.trim().toString().isNotEmpty == true) {
          coordinator.isValidName(name.text);
        }
        break;

      case 'profession':
        if (profession.text.trim().toString().isNotEmpty == true) {
          coordinator.isValidProfession(profession.text);
        }
        break;

      case 'email':
        if (emailId.text.trim().toString().isNotEmpty == true) {
          coordinator.isValidEmail(emailId.text);
        }
        break;
    }
  }

  void _checkDob(CustomerDetailsCoordinator coordinator) {
    if (dobError.isNotEmpty) {
      coordinator.isValidDob(dob.text);
    }
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    if (inputFormat
            .parse(DateTime.now().toString())
            .difference(inputFormat.parse(selectedDate.toString()))
            .inDays
            .abs() <
        6575) {
      coordinator.inVaidDob();
    }
  }
}
