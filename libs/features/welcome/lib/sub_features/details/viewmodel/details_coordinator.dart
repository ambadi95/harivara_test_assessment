

import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';

class DetailsCoordinator extends BaseViewModel<DetailsState>{
  final DetailsUseCase _detailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  DetailsCoordinator( this._navigationHandler, this._detailsUseCase,) : super(const DetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  bool _validateForm(String name, String dob, String gender, String profession, String mobNumber,
      String emailId, String address, String poBox, String region, String district){
    var isnNameValid = name.isNotEmpty;
    var isMobileNoValid = mobNumber.isNotEmpty;
    var isDobValid = dob.isNotEmpty;
    var isGenderValid = gender.isNotEmpty;
    var isProfessionValid = profession.isNotEmpty;
    var isEmailIdValid = emailId.isNotEmpty;
    var isAddressValid = address.isNotEmpty;
    var isPoBoxValid = poBox.isNotEmpty;
    var isRegionValid = region.isNotEmpty;
    var isDistrictValid = district.isNotEmpty;
    var _isValid = isnNameValid && isMobileNoValid && isDobValid && isGenderValid
        && isProfessionValid && isEmailIdValid && isAddressValid
    && isPoBoxValid && isRegionValid && isDistrictValid;
    return _isValid;
  }

  void validateForm(String name, String dob, String gender, String profession, String mobNumber,
      String emailId, String address, String poBox, String region, String district){
    state =DetailsState.DetailsFormState(_validateForm(name, dob,gender,profession,mobNumber,emailId,address,poBox,region,district));
  }

  Future navigateToCreatePasscodeScreen() async {
    _navigationHandler.openForNewPasscode();
  }

}