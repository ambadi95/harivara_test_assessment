import 'package:config/Colors.dart';
import 'package:core/navigation/modal_bottom_sheet.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:config/Config.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class LoginNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  LoginNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> navigateToOnBoardScreen(UserType userType) async {
    var arguments = WelcomeScreenArgs('', '', userType, false);
    await _navigationManager.navigateTo(
      CrayonWelcomScreen.viewPath,
      NavigationType.replace(),
      arguments: arguments
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
            : OTPEvent.Customer_Login.toShortString(),"","",false);

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
        OTPEvent.Agent_Login.toShortString(),"","",false);

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

  Future<void> navigateToOtpBottomSheet(String title, String message,
      String buttonLabel, UserType userType,String mobileNumber, String customerId) async {
    final CrayonPaymentBottomSheetIcon icon = CrayonPaymentBottomSheetY9Logo();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.infoState(
            buttonOptions: [
              ButtonOptions(PRIMARY_COLOR, buttonLabel, () {
                navigateToOtpScreenAgentCustomer(userType,mobileNumber,customerId);
              }, false)
            ],
            subtitle: message,
            disableCloseButton: true,
            bottomSheetIcon: icon,
            isSvg: false,
            title: title,);

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToOtpScreenAgentCustomer(
      UserType userType, String mobileNumber, String id) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'passcodeModule/passcode',
        false,
        2,
        OtpVerificationType.customerPasscodeSet,
        id,
        6,
        mobileNumber,
        false,
        userType,userType==UserType.Agent?OTPEvent.Agent_Login.toShortString():OTPEvent.Customer_Login.toShortString(),"","",false);

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreenCustomerFlow(
      UserType userType, String mobileNumber, String id) async {
    var arguments = OtpScreenArgs(
        'OTP Verification',
        'VO_otp_verification_description',
        'welcomeModule/details',
        false,
        2,
        OtpVerificationType.mobile,
        id,
        6,
        mobileNumber,
        false,
        userType,userType==UserType.Agent?OTPEvent.Agent_Login.toShortString():OTPEvent.Customer_Login.toShortString(),"","",false);

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }
}
