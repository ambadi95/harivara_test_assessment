

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class ScanQRCodeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  ScanQRCodeNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      const NavigationType.push(),
    );
  }

}
