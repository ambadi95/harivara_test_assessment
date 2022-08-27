import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/data_model/gender_type.dart';
import 'package:welcome/sub_features/customer_profile_details/state/customer_details_state.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'customer_details_usecase.dart';

class CustomerDetailsCoordinator extends BaseViewModel<CustomerDetailsState> {
  final CustomerDetailsUseCase _customerDetailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  CustomerDetailsCoordinator(
    this._navigationHandler,
    this._customerDetailsUseCase,
  ) : super(const CustomerDetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  List<GenderType> get genderType => [
        const GenderType(1, 'Male'),
        const GenderType(2, 'Female'),
        const GenderType(3, 'Prefer not to say'),
      ];

  Future getRegion(UserType userType) async {
    var response =
        await _customerDetailsUseCase.getRegion((p0) => null, userType);
    return response?.data;
  }

  Future getDistrict(int regionId, UserType userType) async {
    var response = await _customerDetailsUseCase.getDistrict(
        regionId.toString(), (p0) => null, userType);
    return response?.data;
  }

  Future getCustomerDetails() async {
    var response =
        await _customerDetailsUseCase.getCustomerDetails((p0) => null);
    if (response?.status == true) {
      CrayonPaymentLogger.logInfo(response!.data!.referenceId!.toString());
      state = CustomerDetailsState.getRegion(response.data!.region!);
      state = CustomerDetailsState.getDistrict(response.data!.district!);
      return response;
    } else {
      CrayonPaymentLogger.logInfo(response!.message!);
    }
  }

  void setGenderType(GenderType genderType) {
    state = CustomerDetailsState.onGenderTypeChoosen(genderType);
  }

  void setRegion(Datum region) {
    state = CustomerDetailsState.onRegionChoosen(region);
  }

  void setDistrict(b.Datum district) {
    state = CustomerDetailsState.onDistrictChoosen(district);
  }

  Future<void> getMobileNumber() async {
    String getMobileNo = await _customerDetailsUseCase.getMobileNumber();
    state = CustomerDetailsState.getMobileNumber(getMobileNo);
  }

  bool _validateForm(
      String name,
      String dob,
      String gender,
      String profession,
      String mobNumber,
      String emailId,
      String address,
      String poBox,
      String region,
      String district) {
    var isnNameValid = _customerDetailsUseCase.isValidName(name);
    var isMobileNoValid = mobNumber.isNotEmpty;
    var isDobValid = dob.isNotEmpty;
    var isGenderValid = (gender == 'null') ? false : gender.isNotEmpty;
    var isProfessionValid = profession.isNotEmpty;
    var isEmailIdValid = _customerDetailsUseCase.isValidEmail(emailId);
    var isAddressValid = address.isNotEmpty;
    var isPoBoxValid = /*_customerDetailsUseCase.isValidPoBox(poBox)*/ true;
    var isRegionValid = region.isNotEmpty;
    var isDistrictValid = district.isNotEmpty;

    var _isValid = isnNameValid &&
        isMobileNoValid &&
        isDobValid &&
        isGenderValid &&
        isProfessionValid &&
        isEmailIdValid &&
        isAddressValid &&
        isPoBoxValid &&
        isRegionValid &&
        isDistrictValid;

    return _isValid;
  }

  void validateForm(
      String name,
      String dob,
      String gender,
      String profession,
      String mobNumber,
      String emailId,
      String address,
      String poBox,
      String region,
      String district) {
    print(gender);
    state = CustomerDetailsState.DetailsFormState(_validateForm(
        name,
        dob,
        gender,
        profession,
        mobNumber,
        emailId,
        address,
        poBox,
        region,
        district));
  }

  Future navigateToCreatePasscodeScreen(UserType userType) async {
    _navigationHandler.openForNewPasscode(userType);
  }

  bool isValidName(String name) {
    bool result = _customerDetailsUseCase.isValidName(name);
    if (!result) {
      state = const CustomerDetailsState.nameError('DV_name_error_text');
    } else {
      state = const CustomerDetailsState.nameError('');
    }
    return result;
  }

  bool isValidEmail(String emailId) {
    bool result = _customerDetailsUseCase.isValidEmail(emailId);
    if (!result) {
      state = const CustomerDetailsState.emailError('DV_email_error_text');
    } else {
      state = const CustomerDetailsState.emailError('');
    }
    return result;
  }

  bool isValidPoBox(String poBox) {
    // bool result = _customerDetailsUseCase.isValidPoBox(poBox);
    // if (!result) {
    //   state = const CustomerDetailsState.poBoxError('DV_poBox_error_text');
    // } else {
    //   state = const CustomerDetailsState.poBoxError('');
    // }
    // return result;
    return true;
  }

  bool isValidDob(String dob) {
    var result = dob.isNotEmpty;
    if (!result) {
      state = const CustomerDetailsState.dobError('DV_dob_error_text');
    } else {
      state = const CustomerDetailsState.dobError('');
    }
    return result;
  }

  bool inVaidDob() {
    state = CustomerDetailsState.dobError('DV_invalid_dob_error_text');
    return false;
  }

  bool isValidGender(
    String gender,
  ) {
    var result = gender.isNotEmpty;
    if (!result) {
      state = const CustomerDetailsState.genderError('DV_gender_error_text');
    } else {
      state = const CustomerDetailsState.genderError('');
    }
    return result;
  }

  bool isValidProfession(String prof) {
    var result = prof.isNotEmpty;
    if (!result) {
      state = const CustomerDetailsState.professionError(
          'DV_profession_error_text');
    } else {
      state = const CustomerDetailsState.professionError('');
    }
    return result;
  }

  bool isValidAddress(String address) {
    var result = address.isNotEmpty;
    if (!result) {
      state = const CustomerDetailsState.addressError('DV_address_error_text');
    } else {
      state = const CustomerDetailsState.addressError('');
    }
    return result;
  }

  bool isValidRegion(String region) {
    var result = region.isNotEmpty;
    if (!result) {
      state = const CustomerDetailsState.regionError('DV_region_error_text');
    } else {
      state = const CustomerDetailsState.regionError('');
    }
    return result;
  }

  bool isValidDistrict(String district) {
    var result = district.isNotEmpty;
    if (!result) {
      state =
          const CustomerDetailsState.districtError('DV_district_error_text');
    } else {
      state = const CustomerDetailsState.districtError('');
    }
    return result;
  }

  Future updateDetails(
    String name,
    String dob,
    String gender,
    String address,
    String district,
    String emailId,
    String poBox,
    String profession,
    String region,
    UserType userType,
  ) async {
    state = const CustomerDetailsState.LoadingState();
    var response = await _customerDetailsUseCase.updateCustomerDetails(
        name,
        dob,
        gender,
        address,
        profession,
        emailId,
        poBox,
        region,
        district,
        (p0) => null,
        userType);
    if (response?.status == true) {
      state = const CustomerDetailsState.initialState();
      if (kDebugMode) {
        print(response?.message);
      }
      //   navigateToCreatePasscodeScreen(userType);
    } else {
      state = const CustomerDetailsState.initialState();
      if (kDebugMode) {
        print(response?.message);
      }
    }
  }
}
