

import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:home/home/home_screen_arguments.dart';

class ScanQRCodeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  ScanQRCodeNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      const NavigationType.replace(),
    );
  }


  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(isAgent: true, userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToSuccessScreen(UserType userType) async {
    await _navigationManager.navigateTo(
      SuccessScreen.viewPath,
      const NavigationType.push(),
    );
  }

}
