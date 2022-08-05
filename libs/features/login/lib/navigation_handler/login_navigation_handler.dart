import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
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

  Future<void> navigateToOtpScreen(
      String userType, String mobileNumber, String id) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'welcomeModule/enrollmentSuccess',
        false,
        2,
        OtpVerificationType.customerSign,
        id,
        6,
        mobileNumber,
        false,
        userType);

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreenForAgent(
      String userType, String mobileNumber) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'welcomeModule/welcomeback',
        false,
        2,
        OtpVerificationType.agentSignIn,
        '',
        6,
        mobileNumber,
        false,
        userType);

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToResetPasscode(String userType) async {
    var arguments = SignUpArguments(
      'SU_reset_passcode',
      'SU_reset_subtitle',
      userType,
      userType == 'Agent'
          ? SignupType.resetPasscodeAgent
          : SignupType.resetPasscodeCustomer,
      false,
    );
    await _navigationManager.navigateTo(
        SignUp.viewPath, const NavigationType.push(),
        arguments: arguments);
  }
}
