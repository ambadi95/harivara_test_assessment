import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';

import '../../../../../navigation_handler/welcome_navigation_handler.dart';

class CustomerOnBoardingApprovalCoordinator extends BaseViewModel<SignUpState> {
  final WelcomeNavigationHandler _navigationHandler;

  CustomerOnBoardingApprovalCoordinator(this._navigationHandler)
      : super(const SignUpState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToTermsCondition() {
    _navigationHandler.navigateToTermsCondtionsScreen();
  }
}