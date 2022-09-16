import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/home_screen_arguments.dart';
import '../view/configuremdm_successful_screen.dart';
import 'package:home/home/view/home_screen.dart';

class ConfigureMdmNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  ConfigureMdmNavigationHandler(this._navigationManager);

  Future<void> navigateToConfigureMdmSuccessScreen(String imei) async {
    var argument = imei;
    await _navigationManager.navigateTo(
        ConfigureMdmSuccessScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> navigateToHomeScreen() async {
    var argument = HomeScreenArgs(isAgent: false, userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath,
        NavigationType.replace(),
        arguments: argument
    );
  }

  Future<void> navigateToSuccessScreen() async {
    var argument = "Test";
    await _navigationManager.navigateTo(
        SuccessScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

}
