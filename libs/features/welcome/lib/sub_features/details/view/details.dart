import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:widget_library/utils/app_utils.dart';
import 'package:flutter/services.dart';
import 'package:welcome/data_model/details_arguments.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/alert_dialogue/crayon_payment_alert_dialogue.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/dropdown/crayon_drop_down.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../../data_model/gender_type.dart';

class DetailsScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/details';
  final UserType userType;

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
  String organizationTypeError = '';

  List<DropdownMenuItem<GenderType>> genderTypeDropDown = [];
  List<DropdownMenuItem<Datum>> regionDropDown = [];
  List<DropdownMenuItem<b.Datum>> districtDropDown = [];
  List<String> organisationTypeList = [];
  GetCustomerDetailsResponse? customerDetail;


  GenderType? _genderType;
  Datum? _region;
  b.Datum? _district;
  List<b.Datum> dis = [];
  String? organizationType;

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
  final TextEditingController nidaNumber = TextEditingController();
  final TextEditingController organizationTypeController = TextEditingController();

  final FocusNode genderFocusNode = FocusNode();

  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 8035));
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _selectDate(
      BuildContext context, DetailsCoordinator coordinator) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        helpText: 'DV_select_dob'.tr,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101),
        initialDatePickerMode: DatePickerMode.year,
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

  @override
  Widget build(BuildContext context) =>
      BaseView<DetailsCoordinator, DetailsState>(
          onStateListenCallback: (preState, newState) =>
              {_listenToStateChanges(context, newState)},
          setupViewModel: (coordinator) async {
            await coordinator.getMobileNumber();
            await coordinator.getNIDANumber();
            List<Datum> regions = await coordinator.getRegion(widget.userType);
            organisationTypeList = await coordinator.getOrganizationType(widget.userType);
            genderTypeDropDown = getDropDownData(coordinator.genderType);
            regionDropDown = getRegionDropDownData(regions);
            customerDetail = await coordinator.getCustomerDetail(
                regionDropDown, widget.userType);
            if(customerDetail!.data!=null && customerDetail!.data!.firstName!=null) {
              name.text = customerDetail!.data!.firstName! +
                  ' ' +
                  customerDetail!.data!.lastName!;
              dob.text = customerDetail!.data!.birthdate!;
              selectedDate = DateFormat('dd/MM/yyyy')
                  .parse(customerDetail!.data!.birthdate.toString());
              profession.text = customerDetail!.data!.profession!;
              emailId.text = customerDetail!.data!.emailId!;
              address.text = customerDetail!.data!.address!;
             poBox.text = customerDetail!.data!.organization ?? "";
              district.text = customerDetail!.data!.district!;
              region.text = customerDetail!.data!.region!;
              gender.text = customerDetail!.data!.gender!;

              if (customerDetail!.data != null) {
                coordinator.isValidDob(dob.text);
                coordinator.isValidDistrict(district.text);
                coordinator.isValidRegion(region.text);
              }
              if (_region != null) {
                dis =
                await coordinator.getDistrict(_region!.id!, widget.userType);
                districtDropDown = getDistrictDropDownData(dis);
                coordinator.fetchDistrictState(customerDetail!.data!.district!);
                setState(() {
                });
              }
            }
          },
          builder: (context, state, coordinator) => SafeArea(
                child: state.maybeWhen(
                  LoadingState: () =>
                      _buildMainUIWithLoading(context, coordinator),
                  orElse: () => Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size(double.infinity,
                          widget.userType == UserType.AgentCustomer ? 58 : 102),
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
                ),
              ));

  Widget _buildTopContainer(
    BuildContext context,
    DetailsCoordinator coordinator,
  ) {
    return Column(
      children: [
        widget.userType == UserType.AgentCustomer
            ? const SizedBox()
            : _onBoardingProgressBar(),
        _buildBackBtn(context, coordinator),
      ],
    );
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    DetailsCoordinator coordinator,
  ) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(child: _buildMainUI(context, coordinator)),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return const Center(
      child: CenteredCircularProgressBar(
          color: config_color.PRIMARY_COLOR),
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

  Widget _buildMainUI(BuildContext context, DetailsCoordinator coordinator) {
    print("widget user type====> ${widget.userType}");
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _subtitle(),
          const SizedBox(
            height: 39,
          ),
          widget.userType == UserType.AgentCustomer
              ? _buildLabelTextField(
              'nidaNumber',
              'DV_nida_no_label'.tr,
              nidaNumber,
              TextInputType.number,
              coordinator,
              '',
              'LS_nida_hint_text',
              false,): const SizedBox(),
          _buildLabelTextField(
              'name',
              'DV_name_label'.tr,
              name,
              TextInputType.text,
              coordinator,
              nameError,
              'DV_name_hint_text',
              true,
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                FilteringTextInputFormatter.deny(RegExp('[0-9]')),
              ]
          ),
          _buildLabelTextFieldDob('DV_dob_label'.tr, dob, coordinator),
          _buildGenderTypeDropdown(coordinator),
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
              'pobox',
              'DV_po_box_label'.tr,
              poBox,
              TextInputType.text,
              coordinator,
              poBoxError,
              'DV_poBox_hint_text',
              true),
          _buildOrganizationDropDown(organisationTypeList,coordinator),
          _buildLabelTextField(
              'contact',
              'DV_contact_no_label'.tr,
              mobileNumber,
              TextInputType.number,
              coordinator,
              '',
              'LS_mobile_hint_text',
              false),
          _buildLabelTextField(
              'email',
              'DV_email_label'.tr,
              emailId,
              TextInputType.emailAddress,
              coordinator,
              emailError,
              'DV_email_hint_text',
              true),
          _buildLabelTextFieldAddress('DV_address_label'.tr, address,
              coordinator, 'DV_address_hint_text'),
          _buildRegionDropdown(coordinator),
          _buildDistrictDropdown(coordinator),
          _buildContinueButton(context, coordinator)
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      widget.userType == UserType.AgentCustomer
          ? 'DV_agent_aided_title'.tr
          : 'DV_title'.tr,
      style: SU_title_style,
    );
  }

  Widget _subtitle() {
    return widget.userType == UserType.AgentCustomer
        ? Container(
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
                    'DV_agent_aided_subtitle'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: VO_DescriptionColor,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _buildLabelTextField(
      String tag,
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      DetailsCoordinator coordinator,
      String errorText,
      String hint,
      bool enabled,
      {List<TextInputFormatter>? inputFormatter ,}) {
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
              inputFormatters: inputFormatter ?? [],
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
      DetailsCoordinator coordinator) {
    return FocusScope(
      onFocusChange: (focus) {
        if (dob.text.isNotEmpty) {
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
      },
      canRequestFocus: true,
      child: Padding(
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
              if (dobError.isNotEmpty) {
                coordinator.isValidDob(dob.text);
              }
              await _selectDate(context, coordinator);
            },
          )),
    );
  }

  Widget _buildLabelTextFieldAddress(
      String label,
      TextEditingController controller,
      DetailsCoordinator coordinator,
      String hint) {
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

  Widget _buildGenderTypeDropdown(DetailsCoordinator coordinator) {
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
                style: const  TextStyle(color: Color(0xFFA3A3A3), fontFamily: 'Montserrat' , fontSize:14),
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

  Widget _buildOrganizationDropDown(List<String> organizationTypeList, DetailsCoordinator coordinator){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonDropDown(
          items: organizationTypeList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'brown',
                ),),
            );
          }).toList(),
          key: const Key('organizationDropDown'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ES_grey_button_color,
          ),
          boxHeight: 60,
          hint: Text(
            'DV_select_organization_type'.tr,
            style: const  TextStyle(color: Color(0xFFA3A3A3), fontFamily: 'Montserrat' , fontSize:14),

          ),
          error: organizationTypeError,
          value: organizationType,
          onChanged: (value) {
            onOrganizationTypeChosen(value.toString(),coordinator);
           organizationTypeController.text = value.toString();

          },
          title: 'DV_organization_type'.tr,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(organizationTypeError.tr, style: label_input_error_style),
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
            style: const  TextStyle(color: Color(0xFFA3A3A3), fontFamily: 'Montserrat' , fontSize:14),
          ),
          boxHeight: 60,
          error: districtError,
          value: _district,
          items: districtDropDown,
          onChanged: (value) {
            value as b.Datum;
            if (value.name != 'Select District') {
              onDistrictChosen(value as b.Datum, coordinator);
              district.text = value.name!;
              _validateForm(coordinator);
              coordinator.isValidDistrict(value.name!);
            }
          }
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
            style: const  TextStyle(color: Color(0xFFA3A3A3), fontFamily: 'Montserrat' , fontSize:14),
          ),
          boxHeight: 60,
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
            districtDropDown = getDistrictDropDownData([b.Datum(id: 0,name: 'DV_district_hint_text'.tr)]);
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

  Widget _buildContinueButton(
      BuildContext buildContext, DetailsCoordinator coordinator) {
    return GestureDetector(
      onTap: () async {
        coordinator.isValidName(name.text);
        _checkDob(coordinator);
        coordinator.isValidGender(gender.text);
        coordinator.isValidPoBox(poBox.text);
        coordinator.isValidEmail(emailId.text);
        coordinator.isValidDistrict(district.text);
        coordinator.isValidRegion(region.text);
        coordinator.isValidProfession(profession.text);
        coordinator.isValidAddress(address.text);
        coordinator.isValidOrganizationType(organizationTypeController.text);

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
        } else if (organizationTypeError.tr.isNotEmpty) {
          _showAlert(organizationTypeError.tr);

          return;
        }
        if (coordinator.isValidPoBox(poBox.text) &&
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
              organizationTypeController.text,
              widget.userType,
              customerDetail!.data==null || customerDetail!.data!.firstName==null ? "POST" :" PUT");
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
            'SU_button_text'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }

  void _showAlert(String errorMessage) {
    CrayonPaymentAlertDialogue.showMaterialAlert(
        context: context,
        isColumn: true,
        title: 'DV_alert'.tr,
        content: errorMessage,
        defaultActionText: 'DV_close'.tr);
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
          child:
              item.name.toString() == 'DV_district_hint_text'.tr ?
              Text(
                item.name.toString(),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ):
          Text(
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

  void onOrganizationTypeChosen(
      String value,
      DetailsCoordinator coordinator,
      ) {
    coordinator.setOrganizationType(value);
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
        organizationTypeError: (value){
          organizationTypeError = value;
        },
        getMobileNumber: (value) {
          mobileNumber.text = value.toMobileString();
        },
        getNIDANumber: (value) {
          nidaNumber.text = value.toNIDAString();
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
        onOrganizationTypeChoosen: (value) {
          organizationTypeController.text = value;
          organizationType = value;
        },
        onGenderTypeFetched: (genderType) {
          var item = genderTypeDropDown.firstWhereOrNull((element) =>
              element.value != null && element.value!.gender == genderType);
          if (item != null) {
            _genderType = item.value;
          }
        },
        onRegionFetched: (region) {
          var regionItem = regionDropDown.firstWhereOrNull((element) =>
              element.value != null && element.value!.name == region);
          if (regionItem != null) {
            _region = regionItem.value;
          }
        },

        onDistrictFetched: (district) {
          var districtItem = districtDropDown.firstWhereOrNull((element) =>
              element.value != null && element.value!.name == district);
          if (districtItem != null) {
            _district = districtItem.value;
          }
        },
        onOrganizationTypeFetched: (organization){
          var orgTypeItem = organisationTypeList.firstWhereOrNull((element) =>
              element != null && element == organization
          );
          if(orgTypeItem !=null){
            organizationType = orgTypeItem;
            organizationTypeController.text = orgTypeItem;
          }
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
        nidaNumber.text,
        emailId.text,
        address.text,
        poBox.text,
        region.text,
        district.text,
      organizationTypeController.text
    );
  }

  void _checkValid(String label, DetailsCoordinator coordinator) {
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

  void _checkDob(DetailsCoordinator coordinator) {
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
