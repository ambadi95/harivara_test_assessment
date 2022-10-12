import 'dart:ui';
import 'package:get/get.dart';

import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:kyc/subfeatures/kycmain/view/kyc_credit_main_screen.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:login/view/login_screen.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_faq_screen_args.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_screen_args.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';
import 'package:welcome/data_model/agent_detail_arguments.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/agent_details/view/agent_details.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/signup/sub_features/customer_onboarding_approval/view/customer_onboarding_approval.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:device_option/view/device_option_screen.dart';
import 'package:agent_nearby/view/agent_nearby_screen.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';
import '../sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:termscondition/termscondition/view/terms_condition_view.dart';
import 'package:termscondition/termscondition/view/terms_condition_screen.dart';

class WelcomeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  WelcomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToTermsAndConditionsScreen(UserType userType) async {
    var arguments = TermsConditionScreenArgs(userType: userType, isPasscode: false);
    await _navigationManager.navigateTo(
        CrayonTermsConditionScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToSignUpScreen(UserType userType) async {
    if (userType == UserType.Customer) {
      var arguments = SignUpArguments(
        'SU_title',
        'SU_subtitle',
        userType,
        SignupType.customerSignUp,
        true,
      );
      await _navigationManager.navigateTo(
          SignUp.viewPath, const NavigationType.push(),
          arguments: arguments);
    } else {
      var arguments = SignUpArguments(
        'SU_title_agent',
        'SU_subtitle',
        userType,
        SignupType.agentSignUp,
        true,
      );
      await _navigationManager.navigateTo(
          SignUp.viewPath, const NavigationType.push(),
          arguments: arguments);
    }
  }

  Future<void> navigateToKycScreen() async {
    var argument = KycScreenArgs(
      KycFieldType.KYC_VALIDATION,
      "",
      "",
      "",
      "",
      [KYCDataModel(title: "", isSelected: false)],
      false
    );
    _navigationManager.navigateTo(
        KycCreditMainScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToCreatePasscodeScreen() async {
    await _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> openForNewPasscode(UserType userType) async {
    String user;
    switch (userType) {
      case UserType.Customer:
        user = 'Customer';
        break;
      case UserType.Agent:
        user = 'Agent';
        break;
      case UserType.AgentCustomer:
        user = 'AgentCustomer';
        break;
    }
    var arguments = PasscodeScreenArgs(
        'PC_create_passcode',
        'PC_passcode_message',
        'welcomeModule/enrollmentSuccess',
        userType == UserType.AgentCustomer ? false : true,
        3,
        PassCodeVerificationType.create,
        false,
        '',
        userType);

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

  Future<void> navigateToDeviceOption(
      bool isEnrolled, UserType userType) async {
    var argument = DeviceOptionArgs(isEnrolled, '', userType);
    await _navigationManager.navigateTo(
        DeviceOption.viewPath, const NavigationType.push(),
        arguments: argument);
  }

  Future<void> navigateToLogin(UserType userType) async {
    await _navigationManager.navigateTo(
        Login.viewPath, const NavigationType.push(),
        arguments: userType);
  }

  Future<void> navigateToLoginFromLogout(UserType userType) async {
    await _navigationManager.navigateTo(
        Login.viewPath, const NavigationType.replace(),
        arguments: userType);
  }

  Future<void> showErrorBottomSheet(
      Widget widget, BuildContext context,) async {
    showModalBottomSheet(
        barrierColor: const Color(0xFF9B9B9B).withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: MediaQuery.of(context).size.height * .55,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(height: Get.height * 0.45, child: widget),
            ),
          );
        });
  }


  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(isAgent: true, userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToHome(UserType userType) async {
    var argument = HomeScreenArgs(
        isAgent: userType == UserType.Customer ? false : true,
        userType: userType);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToCustomerEnrollmentScreen() async {
    var argument = UserType.Customer;
    _navigationManager.navigateTo(
        EnrollmentSuccessScreen.viewPath, const NavigationType.replaceCurrent(),
        arguments: argument);
  }

  Future<void> navigateToTermsCondtionsScreen() async {
    var arguments = TermsConditionAndFaqScreenArgs(isFAQ: false);
    _navigationManager.navigateTo(
        CrayonTermsCondition.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToAgentDetailScreen(UserType userType) async {
    var arguments = AgentDetailScreenArguments('DV_title_agent', 'DV_subtitle',
        AgentDetailScreenType.Signup, userType, true);
    await _navigationManager.navigateTo(
        AgentDetailsScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToOtpScreenCustomerSignUp(
      UserType userType, String mobileNumber,
      {String? userId,bool isForUpdate=false,String nidaNumber="",String updateBy=""}) async {
    var arguments = OtpScreenArgs(
      'OTP Verification',
      'VO_otp_verification_description',
      userType == UserType.Customer
          ? 'welcomeModule/details'
          : 'welcomeModule/agentDetails',
      true,
      2,
      OtpVerificationType.mobile,
      userId!,
      6,
      mobileNumber,
      false,
      userType,
        OTPEvent.Customer_Registration.toShortString(),updateBy,nidaNumber,isForUpdate
    );
    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreenCustomerSignUpByAgent(
      UserType userType, String mobileNumber,
      {String? userId,bool isForUpdate=false,String nidaNumber="",String updateBy=""}) async {
    var arguments = OtpScreenArgs(
      'OTP Verification',
      'VO_otp_verification_description',
      userType == UserType.Customer
          ? 'welcomeModule/details'
          : 'welcomeModule/agentDetails',
      false,
      2,
      OtpVerificationType.customerSignUpAgent,
      userId!,
      6,
      mobileNumber,
      false,
      userType, OTPEvent.Customer_Registration.toShortString(),updateBy,nidaNumber,isForUpdate
    );
    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreenAgentResetPasscode(UserType userType, String agentId, String mobileNumber,String nidaNumber) async {
    var arguments = OtpScreenArgs(
      'OTP Verification',
      'VO_otp_verification_description',
      'passcodeModule/passcode',
      false,
      2,
      OtpVerificationType.updatePasscodeAgent,
      agentId,
      6,
      mobileNumber,
      false,
      userType,
        OTPEvent.Reset_Passcode.toShortString(),"",nidaNumber,false
    );

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToOtpScreen(
      UserType userType, String agentId, String mobileNumber,String nidaNumber,{bool isForUpdate=false}) async {
    var arguments = OtpScreenArgs(
      'OTP Verification',
      'VO_otp_verification_description',
      userType == UserType.Customer
          ? 'welcomeModule/details'
          : 'welcomeModule/agentDetails',
      true,
      3,
      OtpVerificationType.mobile,
      agentId,
      6,
      mobileNumber,
      false,
      userType,
        userType==UserType.Customer?OTPEvent.Customer_Login.toShortString():OTPEvent.Agent_Login.toShortString(),"",nidaNumber,isForUpdate
    );

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  Future<void> navigateToAgentEnrollmentBottomSheet(
    String message,
  ) async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.agentEnrollment(
            buttonOptions: [
              ButtonOptions(Black, 'Continue to the app', () {}, false)
            ],
            disableCloseButton: true,
            bottomSheetIcon: icon,
            title:
                'Congratulations,\n %{Ashish | click}%\n You have successfully Onboarded',
            subtitle: "Your Y9 Agent ID\n %{XXXXX | click}% ",
            additionalText: [
              "Your Y9 Agent ID has been sent successfully to your mobile number and Email ID"
            ]);

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
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

  Future<void> navigateToAgentAidedCustomerOnBoarding() async {
    var arguments = SignUpArguments('SU_title', 'SU_subtitle',
        UserType.Customer, SignupType.agentAidedCustomerOnBoarding, true);
    await _navigationManager.navigateTo(
        SignUp.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToCustomerOnBoardingApproval() async {
    var arguments = SignUpArguments('SU_title', 'SU_subtitle',
        UserType.Customer, SignupType.agentAidedCustomerOnBoarding, true);
    await _navigationManager.navigateTo(
        CustomerOnBoardingApproval.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToOtpScreenCustomerResetPasscode(
      String userType, String mobileNumber, String id,String nidaNumber) async {
    var arguments = OtpScreenArgs(
      'OTP Verification',
      'VO_otp_verification_description',
      'passcodeModule/passcode',
      false,
      2,
      OtpVerificationType.resetPasscodeCustomer,
      id,
      6,
      mobileNumber,
      false,
      UserType.Customer, OTPEvent.Reset_Passcode.toShortString(),"",nidaNumber,false
    );

    _navigationManager.navigateTo(
      CrayonVerifyOtpScreen.viewPath,
      const NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }

  void navigateToKYCScreen() async {
    var argument = KycScreenArgs(
      KycFieldType.KYC_VALIDATION,
      "",
      "",
      "",
      "",
      [KYCDataModel(title: "", isSelected: false)],
      false
    );
    await _navigationManager.navigateTo(
        KycCreditMainScreen.viewPath, const NavigationType.push(),
        arguments: argument);
  }

// Future<void> navigateToDestination(
//     String? destination,
//     String userType,
//     ) async {
//   if (userType == UserType.Customer &&
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
