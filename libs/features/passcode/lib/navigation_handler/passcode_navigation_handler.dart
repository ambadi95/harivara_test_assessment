

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
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

}