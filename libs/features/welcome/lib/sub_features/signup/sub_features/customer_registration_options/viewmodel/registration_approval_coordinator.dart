import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import '../../../../../navigation_handler/welcome_navigation_handler.dart';


class RegistrationApprovalCoordinator extends BaseViewModel<SignUpState> {
  final WelcomeNavigationHandler _navigationHandler;

  RegistrationApprovalCoordinator(this._navigationHandler)
      : super(const SignUpState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToTermsCondition() {
    _navigationHandler.navigateToTermsCondtionsScreen();
  }

  Future navigateToAgentAidedCustomer()async{
    await _navigationHandler.navigateToAgentAidedCustomerOnBoarding();
  }

  Future navigateCustomerOnBoardingApproval()async{
    await _navigationHandler.navigateToCustomerOnBoardingApproval();
  }
}
