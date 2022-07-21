import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class WelcomeNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  WelcomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToSignUpScreen() async {
    await _navigationManager.navigateTo(
      SignUp.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToCreatePasscodeScreen() async {
    await _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> openForNewPasscode() async {
    var arguments = PasscodeScreenArgs(
      'PC_create_passcode',
      'PC_passcode_message',
      'welcomeModule/enrollmentSuccess',
      true,
      3,
      PassCodeVerificationType.create,
      false,
      '',
    );

    _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToDetailsScreen() async {
    await _navigationManager.navigateTo(
      DetailsScreen.viewPath,
      const NavigationType.push(),
    );
  }

  // Future<void> navigateToDestination(
  //     String? destination,
  //     String userType,
  //     ) async {
  //   if (userType == 'Customer' &&
  //       destination == 'otpModule/mobileRegistration') {
  //     var arguments = new MobileScreenArgs(
  //       'otp-register-with-your-mobile-number',
  //       'otp-send-otp-to-confirm',
  //       'signupModule/signup',
  //       true,
  //       1,
  //       false,
  //       MobileRegistrationType.customerSignUp,
  //       false,
  //     );
  //
  //     _navigationManager.navigateTo(
  //       destination!,
  //       NavigationType.push(),
  //       arguments: arguments,
  //     );
}