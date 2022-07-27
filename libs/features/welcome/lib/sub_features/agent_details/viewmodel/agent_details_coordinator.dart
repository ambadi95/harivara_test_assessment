

import 'package:task_manager/base_classes/base_view_model.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import '../state/agent_details_state.dart';
import 'agent_details_usecase.dart';

class AgentDetailsCoordinator extends BaseViewModel<AgentDetailsState>{
  final AgentDetailsUseCase _agentDetailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  AgentDetailsCoordinator( this._navigationHandler, this._agentDetailsUseCase,) : super(const AgentDetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }



  Future<void> getMobileNumber() async {
     String getMobileNo = await _agentDetailsUseCase.getMobileNumber();
      state = AgentDetailsState.getMobileNumber(getMobileNo);
  }

  bool _validateForm(String name, String dob, String gender, String mobNumber,
      String emailId){
    var isnNameValid = _agentDetailsUseCase.isValidName(name);
    var isMobileNoValid = mobNumber.isNotEmpty;
    var isDobValid = dob.isNotEmpty;
    var isGenderValid = gender.isNotEmpty;
    var isEmailIdValid = _agentDetailsUseCase.isValidEmail(emailId);
    var _isValid = isnNameValid && isMobileNoValid && isDobValid && isGenderValid
        && isEmailIdValid;
    return _isValid;
  }

  void validateForm(String name, String dob, String gender, String mobNumber,
      String emailId){
    state =AgentDetailsState.DetailsFormState(_validateForm(name, dob,gender,mobNumber,emailId));
  }

  Future navigateToOtpScreen(String userType) async {
    _navigationHandler.navigateToOtpScreen(userType);
  }

  bool isValidName(String name){
    bool result = _agentDetailsUseCase.isValidName(name);
    if(!result){
      state = const AgentDetailsState.nameError('DV_name_error_text');
    }else{
      state = const AgentDetailsState.nameError('');
    }
    return result;
  }

  bool isValidEmail(String emailId){
    bool result = _agentDetailsUseCase.isValidEmail(emailId);
    if(!result){
      state = const AgentDetailsState.emailError('DV_email_error_text');
    }else{
      state = const AgentDetailsState.emailError('');
    }
    return result;
  }


  bool isValidDob(String dob){
    var result = dob.isNotEmpty;
    if(!result){
      state = const AgentDetailsState.dobError('DV_dob_error_text');
    }else{
      state = const AgentDetailsState.dobError('');
    }
    return result;
  }

  bool isValidGender(String gender){
    var result = gender.isNotEmpty;
    if(!result){
      state = const AgentDetailsState.genderError('DV_gender_error_text');
    }else{
      state = const AgentDetailsState.genderError('');
    }
    return result;
  }


}