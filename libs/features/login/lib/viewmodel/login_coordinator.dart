import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import '../navigation_handler/login_navigation_handler.dart';
import '../state/login_state.dart';
import 'login_usecase.dart';
import 'package:config/Config.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:get/get.dart';


class LoginCoordinator extends AnalyticsStateNotifier<LoginState> {
  final LoginNavigationHandler _navigationHandler;
  final LoginUseCase _loginUseCase;

  LoginCoordinator(
    this._navigationHandler,
    this._loginUseCase,
  ) : super(const LoginState.initialState());

  void validateForm(String mobNumber, String passcode, String agentId,
      UserType userType, bool havePasscode) {
    var agentID = agentId.isNotEmptyOrNull;
    var mobileNo = _loginUseCase.isValidMobileNumber(mobNumber);
    var passCode = passcode.length == 6;
    bool isValid;
    if (userType == UserType.Customer) {
      isValid = mobileNo;
      if (havePasscode) {
        isValid = mobileNo && passCode;
      }
    } else {
      isValid = mobileNo && agentID;
    }
    state = LoginState.loginFormState(isValid);
  }

  bool isMobileNumberValid(String mobileNumber) {
    var result = _loginUseCase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state = const LoginState.mobileNumberError('LS_mobile_error_text');
    } else {
      state = const LoginState.mobileNumberError('');
    }
    return result;
  }

  bool isAgentIdValid(String agentId) {
    var result = _loginUseCase.isValidAgentId(agentId);
    if (!result) {
      state = const LoginState.agentIdError('SU_agent_id_error_text');
    } else {
      state = const LoginState.agentIdError('');
    }
    return result;
  }

  Future navigateToWelcomeBackScreen(
      String userType, String mobilNumber) async {
    if (userType == UserType.Customer) {
      // _navigationHandler.navigateToOtpScreen(userType, mobilNumber);
    } else {
      //_navigationHandler.navigateToOtpScreenForAgent(userType, mobilNumber);
    }
  }

  Future<void> navigateToResetNow(UserType userType) async {
    await _navigationHandler.navigateToResetPasscode(userType);
  }

  Future login(String mobileNumber, String passcode, UserType userType,
      String agentId) async {
    if (userType == UserType.Customer) {
      await customerLogin(mobileNumber, passcode, userType);
    } else {
      await getAgentDetails(agentId, mobileNumber);
    }
  }

  Future calljwttoken() async {

      state = LoginState.loading();
      var response = await _loginUseCase.callJWTToken((p0) => null);
      if (response?.status == true) {
        state = LoginState.successState();
      } else {
        state = LoginState.successState();
        _showAlertForErrorMessage("Something went wrong,Please try again later!");
        // calljwttoken();
        print(response?.message);



    }
  }

  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

  Future customerLogin(
    String mobileNumber,
    String passcode,
    UserType userType,
  ) async {
    state = LoginState.loading();
    try {
      String selectedLanguage = await _loginUseCase.getLocale();

      var response = await _loginUseCase.login(
          '+255' + mobileNumber, passcode, (p0) => null);
      if (response?.status == true) {
        state = LoginState.successState();
        AppUtils.appUtilsInstance.saveUserType(UserType.Customer);
        await _loginUseCase.setPreferences(
            selectedLanguage, (p0) => null);

          _navigationHandler.navigateToOtpScreen(
              userType, mobileNumber, response!.data!.id!);


      } else {

        state = LoginState.mobileNumberError(response!.message!);
      }
    } catch (e) {
      state = LoginState.initialState();
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
      print(e.toString());
    }
  }

  Future checkPasscode(
    String mobileNumber,
    UserType userType,
  ) async {
    mobileNumber = '+255' + mobileNumber.trim().replaceAll(" ", "");
    state = LoginState.loading();
    try {
      var response =
          await _loginUseCase.getPasscodeCheck(mobileNumber, (p0) => null);
      if (response?.status == true) {
        if (response?.data?.passcodeSet == true) {
          state = LoginState.showPasscode(true);
        } else {
          state = LoginState.loading();
          var customerDetailResponse = await _loginUseCase
              .getCustomerDetailsByMobileNumber(mobileNumber, (p0) => null);
          if (customerDetailResponse?.status == true && customerDetailResponse?.data?.firstName != null) {
            state = LoginState.successState();
            String customerId = await _loginUseCase.getCustomerId();
            _navigationHandler.navigateToOtpBottomSheet(
                'OB_WelcomeTitle',
                'LS_Passcode_message',
                'VO_OtpVerification',
                userType,
                mobileNumber,
                customerId);
          } else{
            state = LoginState.successState();
            String customerId = await _loginUseCase.getCustomerId();
            _navigationHandler.navigateToOtpScreenCustomerFlow(userType,mobileNumber,customerId);
          }
        }
        state = LoginState.successState();
      } else {
        state = LoginState.mobileNumberError(response!.message!);
      }
    } catch (e) {
      state = LoginState.initialState();
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
      print(e.toString());
    }
  }

  Future getAgentDetails(String agentId, String mobileNumber) async {
    state = LoginState.loading();
    try {
      var response = await _loginUseCase.getAgentDetail(
          agentId, '255' + mobileNumber.replaceAll(" ", ""), (p0) => null);
      if (response?.status == true) {
        print(response);
        state = LoginState.successState();
        await _loginUseCase.saveAgentId(agentId);
        await _loginUseCase.saveMobileNumber(response!.data!.mobileNo!);
        AppUtils.appUtilsInstance.saveUserType(UserType.Agent);

        await _loginUseCase.saveAgentName(
            response.data!.firstName! + ' ' + response.data!.lastName!);
        await _loginUseCase.saveAgentType(response.data!.roleName);
        // await _loginUseCase.saveOnBordStatus(agentId);
        await _navigationHandler.navigateToOtpScreenForAgent(
            UserType.Agent, response.data!.mobileNo!, agentId);
      } else {
        state = LoginState.successState();
        state = LoginState.agentIdError('Agent ID not found');
        CrayonPaymentLogger.logError(response!.message!);
      }
    } catch (e) {
      state = LoginState.initialState();
      print(e.toString());
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }

  void goBackWelcomeScreen(UserType usertype) async {
    _navigationHandler.navigateToOnBoardScreen(usertype);
  }

  void goBack() async {
    _navigationHandler.goBack();
  }
// Future agentLogin(String mobileNumber, String nidanumber, String userType,
//     String agentId) async {
//   state = LoginState.loading();
//   var response = await _loginUseCase.loginAgent(
//       '+255' + mobileNumber, nidanumber, agentId, (p0) => null);
//   print(response);
//   if (response?.data != null) {
//     state = LoginState.successState();
//     _navigationHandler.navigateToOtpScreen(userType, mobileNumber, agentId);
//   } else {
//     state = LoginState.successState();
//     print(response?.message);
//   }
// }
}
