import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class HomeNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  HomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToSignUpScreen(String userType) async {
    await _navigationManager.navigateTo(
        SignUp.viewPath,
        const NavigationType.push(),
        arguments: userType
    );
  }


}