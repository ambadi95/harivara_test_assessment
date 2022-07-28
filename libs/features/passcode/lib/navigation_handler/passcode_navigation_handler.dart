

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:home/home/home_screen_arguments.dart';
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

  Future<void> navigateToAgentEnrollmentBottomSheet(String message) async {
    final CrayonPaymentBottomSheetIcon icon = CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState = CrayonPaymentBottomSheetState.infoStateWrap(
      onClose: (){_navigationManager.goBack();},
      bottomSheetIcon: icon,
      title: 'Success',
      subtitle: message,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
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

}