

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class SplashNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  SplashNavigationHandler(this._navigationManager);


  Future<void> navigateToDestinationPath(String destinationPath) async {
    _navigationManager.navigateTo(
      destinationPath,
      const NavigationType.replace(),
    );
  }

}