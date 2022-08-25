import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import '../navigation_handler/login_navigation_handler.dart';
import '../state/login_state.dart';
import 'login_usecase.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
class LoginCoordinator extends AnalyticsStateNotifier<LoginState> {
  final LoginNavigationHandler _navigationHandler;
  final LoginUseCase _loginUseCase;

  LoginCoordinator(
    this._navigationHandler,
    this._loginUseCase,
  ) : super(const LoginState.initialState());

  void validateForm(
      String mobNumber, String passcode, String agentId, String userType) {
    var agentID = agentId.isNotEmptyOrNull;
    var mobileNo = _loginUseCase.isValidMobileNumber(mobNumber);
    var passCode = passcode.length == 6;
    bool isValid;
    if (userType == 'Customer') {
      isValid = mobileNo && passCode;
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
    if (userType == 'Customer') {
      // _navigationHandler.navigateToOtpScreen(userType, mobilNumber);
    } else {
      //_navigationHandler.navigateToOtpScreenForAgent(userType, mobilNumber);
    }
  }

  Future<void> navigateToResetNow(String userType) async {
    await _navigationHandler.navigateToResetPasscode(userType);
  }

  Future login(String mobileNumber, String passcode, String userType,
      String agentId) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    if (userType == 'Customer') {
      await customerLogin(mobileNumber, passcode, userType);
    } else {
      await getAgentDetails(agentId, mobileNumber);
    }
  }

  Future customerLogin(
      String mobileNumber, String passcode, String userType) async {
    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    state = LoginState.loading();
    var response = await _loginUseCase.login(
        '+255' + mobileNumber, passcode, (p0) => null);
    if (response?.status == true) {
      state = LoginState.successState();
      _navigationHandler.navigateToOtpScreen(
          userType, mobileNumber, response!.data!.id!);
    } else {
      //state = LoginState.successState();
      print(response?.message);
      if (response!.message!.contains("Invalid passcode")) {
        state = LoginState.passCodeError(response.message!);
      } else {
        state = LoginState.mobileNumberError(response.message!);
      }
    }
  }

  Future getAgentDetails(String agentId, String mobileNumber) async {

    bool internetStatus = await AppUtils.appUtilsInstance.checkInternet();
    if (!internetStatus) {
      return;
    }
    state = LoginState.loading();
    var response = await _loginUseCase.getAgentDetail(
        agentId, '255' + mobileNumber.replaceAll(" ", ""), (p0) => null);
    if (response?.status == true) {
      print(response);
      state = LoginState.successState();
      await _loginUseCase.saveAgentId(agentId);
      await _loginUseCase.saveMobileNumber(response!.data!.mobileNo!);
      await _loginUseCase.saveAgentName(
          response.data!.firstName! + ' ' + response.data!.lastName!);
      await _loginUseCase.saveOnBordStatus(agentId);
      await _navigationHandler.navigateToOtpScreenForAgent(
          'Agent', response.data!.mobileNo!, agentId);
    } else {
      state = LoginState.successState();
      state = LoginState.agentIdError('Agent ID not found');
      CrayonPaymentLogger.logError(response!.message!);
    }
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
