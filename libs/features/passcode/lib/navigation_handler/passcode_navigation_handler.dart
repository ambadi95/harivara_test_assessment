

import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class PasscodeNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  PasscodeNavigationHandler(this._navigationManager);


  Future<void> navigateToDestinationPath(String destinationPath) async {
    _navigationManager.navigateTo(
      destinationPath,
      const NavigationType.replace(),
    );
  }


  Future<void> navigateToAgentHomeScreen(String destinationPath) async {
    var arguments = HomeScreenArgs(
    true
    );
    _navigationManager.navigateTo(
      destinationPath,
      const NavigationType.replace(),
      arguments: arguments
    );
  }

  Future<void> navigateToAgentEnrollmentBottomSheet(String message,) async {
    final CrayonPaymentBottomSheetIcon icon = CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState = CrayonPaymentBottomSheetState.agentEnrollment(
        buttonOptions: [
          ButtonOptions(Black,'Continue to the app', ()=>navigateToAgentHome(),false)
        ],
        disableCloseButton: true,
        bottomSheetIcon: icon,
        title: 'Congratulations,\n %{Ashish | click}%\n You have successfully Onboarded',
        subtitle: "Your Y9 Agent ID\n %{XXXXX | click}% ",
        additionalText: [
          "Your Y9 Agent id has been sent successfully to your mobile number and Email ID"
        ]
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(
        true
    );
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

}