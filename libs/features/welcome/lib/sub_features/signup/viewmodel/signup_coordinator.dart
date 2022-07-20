

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
    _navigationHandler.navigateToDetailsScreen();
  }

  bool _validateForm(String nidaNo, String mobNumber){
      var isnidaNumberValid = nidaNo.isNotEmpty;
      var ismobileNoValid = mobNumber.isNotEmpty;
      var _isValid = isnidaNumberValid && ismobileNoValid;
      return _isValid;
  }

  void validateForm(String nidaNo, String mobNumber){
    state =SignUpState.SignUpFormState(_validateForm(nidaNo, mobNumber));
  }

}