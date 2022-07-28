

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class SplashNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  SplashNavigationHandler(this._navigationManager);


  Future<void> navigateToDestinationPath(WelcomeScreenArgs welcomeScreenArgs) async {

    _navigationManager.navigateTo(
      CrayonWelcomScreen.viewPath,
      const NavigationType.replace(),
      arguments: welcomeScreenArgs
    );
  }

}