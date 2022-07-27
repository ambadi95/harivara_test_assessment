import 'package:task_manager/base_classes/base_view_model.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import '../state/enrollment_success_state.dart';

class EnrollmentSuccessCoordinator extends BaseViewModel<EnrollmentSuccessState>{
  final WelcomeNavigationHandler _navigationHandler;

  EnrollmentSuccessCoordinator( this._navigationHandler) : super(const EnrollmentSuccessState.initialState()) ;



  Future navigateToAgentNearBy() async {
    _navigationHandler.navigateToNearByAgent();
  }

  Future navigateToDeviceOption() async {
    _navigationHandler.navigateToDeviceOption();
  }

}