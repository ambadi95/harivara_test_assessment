

import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';

class SignUpCoordinator extends BaseViewModel<SignUpState>{
  final SignupUseCase _signupUseCase;
  final WelcomeNavigationHandler _navigationHandler;
  SignUpCoordinator(this._navigationHandler, this._signupUseCase) : super(const SignUpState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  Future navigateToDetailsScreen() async {
    _navigationHandler.navigateToOtpScreen();
  }

  bool _validateForm(String nidaNo, String mobNumber){
      var isnidaNumberValid = _signupUseCase.isValidNINDAnumber(nidaNo);
      var ismobileNoValid = _signupUseCase.isValidMobileNumber(mobNumber);
      var _isValid = isnidaNumberValid && ismobileNoValid;
      return _isValid;
  }

  void validateForm(String nidaNo, String mobNumber){
    state =SignUpState.SignUpFormState(_validateForm(nidaNo, mobNumber));
  }

  bool isValidNidaNumber(String nidaNumber){
    bool result = _signupUseCase.isValidNINDAnumber(nidaNumber);
    if(!result){
      state = const SignUpState.nindaNumberError('SU_title_error_text');
    }else{
      state = const SignUpState.nindaNumberError('');
    }
    return result;
  }

  bool isValidMobileNumber(String mobileNumber){
    bool result = _signupUseCase.isValidMobileNumber(mobileNumber);
    if(!result){
      state = const SignUpState.mobileNumberError('SU_subtitle_error_text');
    }else{
      state = const SignUpState.mobileNumberError('');
    }
    return result;
  }

  Future<void> continueToOtp(String nidaNumber, String mobileNumber) async{
     await _signupUseCase.saveDetails(nidaNumber,'+255 ' + mobileNumber);
  }

}