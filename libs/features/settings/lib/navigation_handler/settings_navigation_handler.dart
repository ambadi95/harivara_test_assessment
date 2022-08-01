import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class SettingsNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;
  SettingsNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToSignUpScreen() async {

      var arguments = SignUpArguments(
        'SU_update_passcode',
        'SU_update_subtitle',
        'Agent',
        SignupType.resetPasscodeAgent,
        false,
      );
      await _navigationManager.navigateTo(
          SignUp.viewPath, const NavigationType.push(),
          arguments: arguments);
  }

}