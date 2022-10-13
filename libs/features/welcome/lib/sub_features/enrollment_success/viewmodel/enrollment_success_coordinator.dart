import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/foundation.dart';
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

  Future navigateToDeviceOption(bool isEnrolled, UserType userType) async {
    _navigationHandler.navigateToDeviceOption(isEnrolled, userType);
  }

  logout() {
    _enrollmentSuccessUseCase.logout();
    _navigationHandler.navigateToLoginFromLogout(UserType.Customer);
  }

  Future backToHome() async {
    await _navigationHandler.navigateToAgentHome();
  }

  Future getCustomerDetails(UserType userType) async {
    try {
      var response = await _enrollmentSuccessUseCase.getCustomerDetails(
          userType, (p0) => null);
      if (response?.status == true) {
        CrayonPaymentLogger.logInfo(response!.data!.referenceId!.toString());
        _enrollmentSuccessUseCase.saveOnBordStatus(response.data!.customerId.toString());
        return response;
      } else {
        CrayonPaymentLogger.logInfo(response!.message!);
      }
    }  catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
     /* AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {goBack();},
      );*/
    }
  }
}
