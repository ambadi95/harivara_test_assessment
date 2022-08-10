import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import '../state/enrollment_success_state.dart';
import 'enrollment_success_usecase.dart';

class EnrollmentSuccessCoordinator
    extends BaseViewModel<EnrollmentSuccessState> {
  final WelcomeNavigationHandler _navigationHandler;
  final EnrollmentSuccessUseCase _enrollmentSuccessUseCase;

  EnrollmentSuccessCoordinator(
    this._navigationHandler,
    this._enrollmentSuccessUseCase,
  ) : super(const EnrollmentSuccessState.initialState());

  Future navigateToAgentNearBy() async {
    _navigationHandler.navigateToNearByAgent();
  }

  Future navigateToDeviceOption(bool isEnrolled) async {
    _navigationHandler.navigateToDeviceOption(isEnrolled);
  }

  logout() {
    _enrollmentSuccessUseCase.logout();
    _navigationHandler.navigateToLoginFromLogout('Customer');
  }

  Future getCustomerDetails(UserType userType) async {
    var response =
        await _enrollmentSuccessUseCase.getCustomerDetails(userType,(p0) => null);
    if (response?.status == true) {
      CrayonPaymentLogger.logInfo(response!.data!.referenceId!.toString());
      return response;
    } else {
      CrayonPaymentLogger.logInfo(response!.message!);
    }
  }
}
