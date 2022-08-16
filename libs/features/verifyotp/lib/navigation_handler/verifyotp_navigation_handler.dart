import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:welcome/sub_features/welcome_back/view/welcome_back.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class VerifyOtpNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  VerifyOtpNavigationHandler(this._navigationManager);

  Future<void> navigateToDestinationPath(
      String destinationPath, UserType userType) async {
    _navigationManager.navigateTo(
        destinationPath, const NavigationType.replace(),
        arguments: userType);
  }

  Future<void> navigateToCustomerEnrollmentScreen() async {
    var argument = UserType.Customer;
    _navigationManager.navigateTo(
        EnrollmentSuccessScreen.viewPath, const NavigationType.push(),
        arguments: argument);
  }

  Future<void> openForNewPasscode(UserType userType) async {
    var arguments = PasscodeScreenArgs(
      'PC_create_passcode',
      'PC_passcode_message',
      'welcomeModule/enrollmentSuccess',
      true,
      3,
      PassCodeVerificationType.create,
      false,
      '',
      userType,
    );

    _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> openForUpdateNewPasscode(UserType userType) async {
    var arguments = PasscodeScreenArgs(
      'PC_create_passcode',
      'PC_passcode_message',
      'welcomeModule/enrollmentSuccess',
      false,
      3,
      PassCodeVerificationType.agentResetPasscode,
      false,
      '',
      userType,
    );

    _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToAgentWelcomeBack(UserType userType) async {
    var args = WelcomeScreenArgs('', '', userType, true);
    _navigationManager.navigateTo(
        CrayonWelcomScreen.viewPath, const NavigationType.replace(),
        arguments: args);
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }
}
