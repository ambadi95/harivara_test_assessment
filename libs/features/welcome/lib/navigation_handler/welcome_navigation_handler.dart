import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:login/view/login_screen.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';
import 'package:welcome/sub_features/agent_details/view/agent_details.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:device_option/view/device_option_screen.dart';
import 'package:agent_nearby/view/agent_nearby_screen.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class WelcomeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  WelcomeNavigationHandler(this._navigationManager);

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

  Future<void> navigateToCreatePasscodeScreen() async {
    await _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      const NavigationType.push(),
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
      userType
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

  Future<void> navigateToNearByAgent() async {
    await _navigationManager.navigateTo(
      AgentNearBy.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToDeviceOption() async {
    await _navigationManager.navigateTo(
      DeviceOption.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToLogin(String userType) async {
    await _navigationManager.navigateTo(
      Login.viewPath,
      const NavigationType.push(),
      arguments: userType
    );
  }

  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(
        true
    );
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> navigateToCustomerHome() async {
    var argument = HomeScreenArgs(
      false
    );
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> navigateToAgentDetailScreen(String userType) async {
    await _navigationManager.navigateTo(
      AgentDetailsScreen.viewPath,
      const NavigationType.push(),
      arguments: userType
    );
  }

  Future<void> navigateToOtpScreen(String userType) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        userType == 'Customer' ? 'welcomeModule/details' : 'welcomeModule/agentDetails',
        true,
        3,
        OtpVerificationType.mobile,
        '',
        6,
        '1234567890',
        false,
        userType,
    );

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToAgentEnrollmentBottomSheet(String message,) async {
    final CrayonPaymentBottomSheetIcon icon = CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState = CrayonPaymentBottomSheetState.agentEnrollment(
      buttonOptions: [
        ButtonOptions(Black,'Continue to the app', (){},false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      title: 'Congratulations,\n %{Ashish | click}%\n You have successfully Onboarded',
      subtitle: "Your Y9 Agent ID\n %{XXXXX | click}% ",
      additionalText: [
        "Your Y9 Agent id has been sent successfully to your mobile number and Email ID"
      ]
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
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
