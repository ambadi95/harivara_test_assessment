import 'package:config/Config.dart';
import 'package:configuremdm/configuremdm_argument.dart';
import 'package:configuremdm/view/configuremdm_screen.dart';
import 'package:configuremdm/view/configuremdm_successful_screen.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:device_option/sub_features/device_details/view/device_detail_screen.dart';
import 'package:device_option/sub_features/device_loan_creation/view/device_loan_creation_screen.dart';
import 'package:device_option/view/device_option_screen.dart';
import 'package:downpayment/view/down_payment_screen.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:kyc/subfeatures/kycmain/view/kyc_credit_main_screen.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:shared_data_models/deviceloancreation/devicecreation_screen_args.dart';
import 'package:shared_data_models/downpayment/downpayment_data_model.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/offlinepayment/offlinepayment_screen_args.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_screen_args.dart';
import 'package:termscondition/termscondition/view/terms_condition_screen.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
import 'package:offline_payment/view/offline_payment_screen.dart';

class VerifyOtpNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  VerifyOtpNavigationHandler(this._navigationManager);

  Future<void> navigateToDestinationPath(
      String destinationPath, UserType userType) async {
    print('navigated 2');
    _navigationManager.navigateTo(
        destinationPath, const NavigationType.replace(),
        arguments: userType);
  }

  Future<void> navigateToDetailScreen() async {
    print('navigated');
    var argument = UserType.AgentCustomer;
    _navigationManager.navigateTo(
        DetailsScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToKycScreen() async {
    var argument = KycScreenArgs(KycFieldType.KYC_VALIDATION, "", "", "", "",
        [KYCDataModel(title: "", isSelected: false)], false);
    _navigationManager.navigateTo(
        KycCreditScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
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

  Future<void> openForNewPasscodeAgentCustomer(UserType userType) async {
    var arguments = PasscodeScreenArgs(
      'PC_create_passcode',
      'PC_passcode_message',
      'homemodule/CrayonHomeScreen',
      false,
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
      PassCodeVerificationType.customerResetPasscode,
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

  Future<void> openForUpdateNewPasscodeAgent(UserType userType) async {
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

  Future<void> navigateToHomeScreen(UserType userType) async {
    var args = HomeScreenArgs(userType: userType, isAgent: false);
    _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: args);
  }

  Future<void> navigateToDeviceDetail(int id, UserType userType) async {
    var arguments = {'userType': userType, 'id': id};
    await _navigationManager.navigateTo(
        DeviceDetailScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToTermsAndConditionsScreen(UserType userType, bool isPasscode) async {
    var arguments = TermsConditionScreenArgs(userType: userType, isPasscode: isPasscode);
    await _navigationManager.navigateTo(
        CrayonTermsConditionScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToDeviceLoanCreation(
      String image, Data deviceDetailData) async {
    var arguments = DeviceLoanCreationArgs(deviceDetailData, image);
    await _navigationManager.navigateTo(
        DeviceLoanCreationScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateOfflinePaymentScreen(int deviceId, String modelName,bool isOutOfStock,bool bottomSheetShown) async {
    var arguments = OfflinePaymentScreenArgs(deviceId, modelName,isOutOfStock,bottomSheetShown);
    _navigationManager.navigateTo(
        OfflinePaymentScreen.viewPath,
        const NavigationType.push(),
        arguments: arguments
    );
  }

  navigateToDownPaymentScreen({String? deviceId,String? amount, num? paymentStatus,num? paymentReceived,String? loanId="",num? loanApproval=0,bool isShowBottomSheet=false}) {
    var arguments = DownPaymentScreenArgs(
        int.parse(deviceId!), amount!, "WORK_FLOW", loanId ?? "", "", paymentStatus ?? 0,paymentStatus ?? 0,paymentReceived ?? 0,loanApproval ?? 0,0,false,isShowBottomSheet);
    _navigationManager.navigateTo(
        DownPaymentScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  void navigateToKYCScreen(bool kycCheck,
      {bool isKycManualApprove = false}) async {
    var argument = KycScreenArgs(KycFieldType.KYC_VALIDATION, "", "", "", "",
        [KYCDataModel(title: "", isSelected: false)], kycCheck,
        kycManualCheckSuccess: isKycManualApprove);
    await _navigationManager.navigateTo(
        KycCreditScreen.viewPath, const NavigationType.replaceCurrent(),
        arguments: argument);
  }

  void navigateToMNOConsentScreen(bool kycCheck) async {
    await _navigationManager.navigateTo(
      KycCreditMainScreen.viewPath,
      const NavigationType.replaceCurrent(),
    );
  }

  Future<void> navigateToDeviceOption(
      bool isEnrolled, UserType userType) async {
    var argument = DeviceOptionArgs(isEnrolled, '', userType);
    await _navigationManager.navigateTo(
        DeviceOption.viewPath, const NavigationType.push(),
        arguments: argument);
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToScanQrCode(int? deviceId) async {
    var arguments = ScanQRCodeArgs(deviceId!,'');
    _navigationManager.navigateTo(
        ScanQrCodeScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToMDMSuccess(String imei) async {
    var argument = imei;
    await _navigationManager.navigateTo(
        ConfigureMdmSuccessScreen.viewPath, const NavigationType.push(),
        arguments: argument);
  }

  Future<void> navigateToMDM({String imei1 = "", String imei2 = ""}) async {
    ConfigureMdmArgs configureMdmArgs =
        ConfigureMdmArgs(imei1: imei1, imei2: imei2);
    await _navigationManager.navigateTo(
        ConfigureMdmScreen.viewPath, const NavigationType.push(),
        arguments: configureMdmArgs);
  }


  Future<void> navigateToFinalSuccess() async {
    var argument = "test";
    await _navigationManager.navigateTo(
        SuccessScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> backToSignUp(UserType userType) async {
    var arguments = WelcomeScreenArgs('', '', userType, false);
    _navigationManager.navigateTo(
        CrayonWelcomScreen.viewPath, const NavigationType.replace(),
        arguments: arguments);
  }

  Future<void> backToDashboard() async {
    var argument = HomeScreenArgs(isAgent: true, userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }


}
