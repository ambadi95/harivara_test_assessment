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
import 'package:config/Config.dart';

class LoginNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  LoginNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToOtpScreen(
      UserType userType, String mobileNumber, String id) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'homemodule/CrayonHomeScreen',
        false,
        2,
        OtpVerificationType.customerSign,
        id,
        6,
        mobileNumber,
        false,
        userType,
        userType == UserType.Agent
            ? OTPEvent.Agent_Login.toShortString()
            : OTPEvent.Customer_Login.toShortString());

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreenForAgent(
      UserType userType, String mobileNumber, String agentId) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'welcomeModule/welcomeback',
        false,
        2,
        OtpVerificationType.agentSignIn,
        agentId,
        6,
        mobileNumber,
        false,
        userType,
        OTPEvent.Agent_Login.toShortString());

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToResetPasscode(UserType userType) async {
    var arguments = SignUpArguments(
      'SU_reset_passcode',
      'SU_reset_subtitle',
      userType,
      userType == UserType.Agent
          ? SignupType.resetPasscodeAgent
          : SignupType.resetPasscodeCustomer,
      false,
    );
    await _navigationManager.navigateTo(
        SignUp.viewPath, const NavigationType.push(),
        arguments: arguments);
  }
}
