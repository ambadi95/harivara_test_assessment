import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

import '../view/configuremdm_successful_screen.dart';

class ConfigureMdmNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  ConfigureMdmNavigationHandler(this._navigationManager);

  Future<void> navigateToConfigureMdmSuccessScreen() async {
    var argument = "Text";
    await _navigationManager.navigateTo(
        ConfigureMdmSuccessScreen.viewPath,
        const NavigationType.push(),
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
}
