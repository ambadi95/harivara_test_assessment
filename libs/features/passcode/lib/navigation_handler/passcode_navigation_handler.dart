import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:get/get.dart';

class PasscodeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  PasscodeNavigationHandler(this._navigationManager);

  Future<void> navigateToDestinationPath(String destinationPath) async {
    _navigationManager.navigateTo(
      destinationPath,
      const NavigationType.replace(),
    );
  }

  Future<void> navigateToCustomerEnrollmentScreen(
      String destinationPath, bool isEnrolled, UserType userType) async {
    UserType argument = userType;
    _navigationManager.navigateTo(
        destinationPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToAgentHomeScreen(String destinationPath) async {
    var arguments = HomeScreenArgs(isAgent: true,userType: UserType.Agent);
    _navigationManager.navigateTo(
        destinationPath, const NavigationType.replace(),
        arguments: arguments);
  }

  Future<void> navigateToAgentEnrollmentBottomSheet(
      String message, String buttonLabel) async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.agentEnrollment(
      buttonOptions: [
        ButtonOptions(Black, buttonLabel, () => navigateToAgentHome(), false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      title: message,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToResetPasscodeBottomSheet(
      String message, String buttonLabel, String description) async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.agentEnrollment(
            buttonOptions: [
              ButtonOptions(
                  Black, buttonLabel, () => navigateToAgentHome(), false)
            ],
            disableCloseButton: true,
            bottomSheetIcon: icon,
            title: message,
            additionalText: [description]);

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(isAgent: true,userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }
}
