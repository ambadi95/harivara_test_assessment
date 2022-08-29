import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class PaymentsNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  PaymentsNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }
  Future<void> goBack() async {
    _navigationManager.goBack();
  }
  Future<void> navigateToPaymentSuccessfullBottomSheet() async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.agentEnrollment(
      buttonOptions: [ButtonOptions(Black, 'Continue', () {
        goBack();
        goBack();
      }, false)],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      additionalText: [],
      title: 'Payment Successful',
      subtitle:
          "Thank you for your payment. An automated payment receipt will be sent yo your registered mobile number ",
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }
}
