import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/data_model/gender_type.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';

class DetailsCoordinator extends BaseViewModel<DetailsState> {
  final DetailsUseCase _detailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  DetailsCoordinator(
    this._navigationHandler,
    this._detailsUseCase,
  ) : super(const DetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  List<GenderType> get genderType => [
        const GenderType(1, 'Male'),
        const GenderType(2, 'Female'),
        const GenderType(3, 'Prefer not to say'),
      ];

  Future getRegion() async {
    var response = await _detailsUseCase.getRegion((p0) => null);
    return response?.data;
  }

  Future getDistrict(int regionId) async {
    var response =
        await _detailsUseCase.getDistrict(regionId.toString(), (p0) => null);
    return response?.data;
  }

  void setGenderType(GenderType genderType) {
    state = DetailsState.onGenderTypeChoosen(genderType);
  }

  void setRegion(Datum region) {
    state = DetailsState.onRegionChoosen(region);
  }

  void setDistrict(b.Datum district) {
    state = DetailsState.onDistrictChoosen(district);
  }

  Future<void> getMobileNumber() async {
    String getMobileNo = await _detailsUseCase.getMobileNumber();
    state = DetailsState.getMobileNumber(getMobileNo);
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
    var isnNameValid = _detailsUseCase.isValidName(name);
    var isMobileNoValid = mobNumber.isNotEmpty;
    var isDobValid = dob.isNotEmpty;
    var isGenderValid = gender.isNotEmpty;
    var isProfessionValid = profession.isNotEmpty;
    var isEmailIdValid = _detailsUseCase.isValidEmail(emailId);
    var isAddressValid = address.isNotEmpty;
    var isPoBoxValid = _detailsUseCase.isValidPoBox(poBox);
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
    state = DetailsState.DetailsFormState(_validateForm(name, dob, gender,
        profession, mobNumber, emailId, address, poBox, region, district));
  }

  Future navigateToCreatePasscodeScreen(String userType) async {
    _navigationHandler.openForNewPasscode(userType);
  }

  bool isValidName(String name) {
    bool result = _detailsUseCase.isValidName(name);
    if (!result) {
      state = const DetailsState.nameError('DV_name_error_text');
    } else {
      state = const DetailsState.nameError('');
    }
    return result;
  }

  bool isValidEmail(String emailId) {
    bool result = _detailsUseCase.isValidEmail(emailId);
    if (!result) {
      state = const DetailsState.emailError('DV_email_error_text');
    } else {
      state = const DetailsState.emailError('');
    }
    return result;
  }

  bool isValidPoBox(String poBox) {
    bool result = _detailsUseCase.isValidPoBox(poBox);
    if (!result) {
      state = const DetailsState.poBoxError('DV_poBox_error_text');
    } else {
      state = const DetailsState.poBoxError('');
    }
    return result;
  }

  bool isValidDob(String dob) {
    var result = dob.isNotEmpty;
    if (!result) {
      state = const DetailsState.dobError('DV_dob_error_text');
    } else {
      state = const DetailsState.dobError('');
    }
    return result;
  }

  bool isValidGender(String gender) {
    var result = gender.isNotEmpty;
    if (!result) {
      state = const DetailsState.genderError('DV_gender_error_text');
    } else {
      state = const DetailsState.genderError('');
    }
    return result;
  }

  bool isValidProfession(String prof) {
    var result = prof.isNotEmpty;
    if (!result) {
      state = const DetailsState.professionError('DV_profession_error_text');
    } else {
      state = const DetailsState.professionError('');
    }
    return result;
  }

  bool isValidAddress(String address) {
    var result = address.isNotEmpty;
    if (!result) {
      state = const DetailsState.addressError('DV_address_error_text');
    } else {
      state = const DetailsState.addressError('');
    }
    return result;
  }

  bool isValidRegion(String region) {
    var result = region.isNotEmpty;
    if (!result) {
      state = const DetailsState.regionError('DV_region_error_text');
    } else {
      state = const DetailsState.regionError('');
    }
    return result;
  }

  bool isValidDistrict(String district) {
    var result = district.isNotEmpty;
    if (!result) {
      state = const DetailsState.districtError('DV_district_error_text');
    } else {
      state = const DetailsState.districtError('');
    }
    return result;
  }

  Future submitDetails(
      String name,
      String dob,
      String gender,
      String address,
      String profession,
      String emailId,
      String poBox,
      String region,
      String district,
      String userType) async {
    state = const DetailsState.LoadingState();
    var response = await _detailsUseCase.submitCustomerDetails(
        name,
        dob,
        gender,
        address,
        profession,
        emailId,
        poBox,
        region,
        district,
        (p0) => null);
    if (response?.status == true) {
      navigateToCreatePasscodeScreen(userType);
    } else {
      print(response?.message);
    }
  }
}
