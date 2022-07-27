import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';
import 'package:welcome/sub_features/welcome_back/view/welcome_back.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class LoginNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  LoginNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
       NavigationType.push(),
    );
  }

  Future<void> navigateToOtpScreen() async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'welcomeModule/enrollmentSuccess',
        false,
        2,
        OtpVerificationType.mobile,
        '',
        6,
        '1234567890',
        false,
        'userType'
    );

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

}
