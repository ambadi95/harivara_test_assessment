

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

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

}