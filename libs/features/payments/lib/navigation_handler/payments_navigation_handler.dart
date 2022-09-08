import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:shared_data_models/payments/payment_status_screen_args.dart';
import 'package:shared_data_models/payments/payment_sucess_screen_args.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:get/get.dart';
import '../sub_features/payment_status/view/payment_status_screen.dart';
import '../sub_features/payment_status/view/payment_success_screen.dart';

class PaymentsNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  PaymentsNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> navigateToHomeScreen() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.replace(),
    );
  }

  Future<void> navigateToPaymentSuccess(
      { String? amount,  String? paymentId}) async {
    PaymentSuccessScreenArgs screenArgs =
        PaymentSuccessScreenArgs(paymentId: paymentId!, amount: amount!);
    await _navigationManager.navigateTo(
        PaymentSuccessScreen.viewPath,
      NavigationType.replaceCurrent(),
      arguments: screenArgs
    );
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToPaymentStatus(
      {required String mobile,
        required String amount,
        required String paymentId}) async {
    PaymentsStatusScreenArgs screenArgs = PaymentsStatusScreenArgs(
      mobileNumber: mobile,
      amount: amount,
      paymentId: paymentId,
    );
    await _navigationManager.navigateTo(
      PaymentStatusScreen.viewPath,
      arguments: screenArgs,
      NavigationType.push(),
    );
  }

  Future<void> navigateToPaymentFailureBottomSheet() async {
    final CrayonPaymentBottomSheetIcon icon =
    CrayonPaymentBottomSheetExclamatoryIcon();
    final CrayonPaymentBottomSheetState infoState =
    CrayonPaymentBottomSheetState.infoState(
      buttonOptions: [
        ButtonOptions(Black, 'Back_To_Home'.tr, () {
          navigateToHomeScreen();
        }, false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      additionalText: [],
      title: 'PF_title'.tr,
      subtitle:
      "PF_desc".tr,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }
}
