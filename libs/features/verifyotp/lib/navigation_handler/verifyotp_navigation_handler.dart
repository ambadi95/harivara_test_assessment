

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class VerifyOtpNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  VerifyOtpNavigationHandler(this._navigationManager);


  Future<void> navigateToDestinationPath(String destinationPath,String userType) async {
    _navigationManager.navigateTo(
      destinationPath,
      const NavigationType.replace(),
      arguments: userType
    );
  }

  Future<void> openForNewPasscode(String userType) async {
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

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

}