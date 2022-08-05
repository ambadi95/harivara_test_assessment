import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';

import '../../../data_model/sign_up_arguments.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';

class SignUpCoordinator extends BaseViewModel<SignUpState> {
  final SignupUseCase _signupUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  SignUpCoordinator(this._navigationHandler, this._signupUseCase)
      : super(const SignUpState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  Future<void> signup(SignUpArguments signUpArguments, String mobileNumber,
      String nindaNumber) async {
    await continueToOtp(nindaNumber, mobileNumber);
    if (signUpArguments.signupType == SignupType.customerSignUp) {
      var response = await _signupUseCase.signUp(
          nindaNumber.replaceAll("-", ""), mobileNumber.trim(), (p0) => null);
      if (response!.status == true) {
          await _signupUseCase.saveCustomerId(response.data?.customerId.toString());
        _navigationHandler.navigateToOtpScreenCustomerSignUp(
            signUpArguments.userType, mobileNumber,userId : response.data?.customerId.toString());
      } else {
        print(response.message);
      }
    } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
      _navigationHandler
          .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
      _navigationHandler
          .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.agentSignUp) {
      _navigationHandler.navigateToAgentDetailScreen(signUpArguments.userType);
    } else if (signUpArguments.signupType ==
        SignupType.agentAidedCustomerOnBoarding) {
      _navigationHandler.navigateToOtpScreenCustomerSignUp(
          signUpArguments.userType, mobileNumber,);
    }
  }

  Future navigateDestination(
      SignUpArguments signUpArguments, String mobileNumber) async {
    if (signUpArguments.signupType == SignupType.customerSignUp) {
      _navigationHandler.navigateToOtpScreenCustomerSignUp(
          signUpArguments.userType, mobileNumber);
    } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
      _navigationHandler
          .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
      _navigationHandler
          .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.agentSignUp) {
      _navigationHandler.navigateToAgentDetailScreen(signUpArguments.userType);
    } else if (signUpArguments.signupType ==
        SignupType.agentAidedCustomerOnBoarding) {
      _navigationHandler.navigateToOtpScreenCustomerSignUp(
          signUpArguments.userType, mobileNumber);
    }
  }

  bool _validateForm(
      String nidaNo, String mobNumber, String agentId, String userType) {
    var agentID = agentId.isNotEmpty;
    var isnidaNumberValid = _signupUseCase.isValidNINDAnumber(nidaNo);
    var ismobileNoValid = _signupUseCase.isValidMobileNumber(mobNumber);
    var _isValid;
    if (userType == 'Customer') {
      _isValid = isnidaNumberValid && ismobileNoValid;
    } else {
      _isValid = isnidaNumberValid && agentID;
    }
    print(_isValid);
    return _isValid;
  }

  void validateForm(
      String nidaNo, String mobNumber, String agentId, String userType) {
    state = SignUpState.SignUpFormState(
        _validateForm(nidaNo, mobNumber, agentId, userType));
  }

  bool isValidNidaNumber(String nidaNumber) {
    bool result = _signupUseCase.isValidNINDAnumber(nidaNumber);
    if (!result) {
      state = const SignUpState.nindaNumberError('SU_title_error_text');
    } else {
      state = const SignUpState.nindaNumberError('');
    }
    return result;
  }

  bool isValidMobileNumber(String mobileNumber) {
    bool result = _signupUseCase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state = const SignUpState.mobileNumberError('SU_subtitle_error_text');
    } else {
      state = const SignUpState.mobileNumberError('');
    }
    return result;
  }

  bool isValidAgentId(String agentId) {
    bool result = _signupUseCase.isValidAgentId(agentId);
    if (!result) {
      state = const SignUpState.agentIdError('SU_agent_id_error_text');
    } else {
      state = const SignUpState.agentIdError('');
    }
    return result;
  }

  Future<void> continueToOtp(String nidaNumber, String mobileNumber) async {
    await _signupUseCase.saveDetails(nidaNumber, '+255' + mobileNumber);
  }

  void navigateToTermsCondition() {
    _navigationHandler.navigateToTermsCondtionsScreen();
  }
}
