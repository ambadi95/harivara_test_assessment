
import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import '../navigation_handler/login_navigation_handler.dart';
import '../state/login_state.dart';
import 'login_usecase.dart';

class LoginCoordinator extends AnalyticsStateNotifier<LoginState>{

  final LoginNavigationHandler _navigationHandler;
  final LoginUseCase _loginUseCase;

  LoginCoordinator(this._navigationHandler,
      this._loginUseCase,) : super(const LoginState());

  void validateForm(String mobNumber, String passcode, String agentId, String userType){
    var agentID = agentId.isNotEmptyOrNull;
    var mobileNo = _loginUseCase.isValidMobileNumber(mobNumber);
    var passCode = passcode.length == 6;
    bool isValid;
    if(userType == 'Customer') {
      isValid = mobileNo && passCode;
    }else{
      isValid = mobileNo && agentID;
    }
    state =LoginState.loginFormState(isValid);
  }

  bool isMobileNumberValid(String mobileNumber){
    var result = _loginUseCase.isValidMobileNumber(mobileNumber);
    if(!result){
      state = const LoginState.mobileNumberError('LS_mobile_error_text');
    }else {
      state = const LoginState.mobileNumberError('');
    }
    return result;
  }

  bool isAgentIdValid(String agentId){
    var result = _loginUseCase.isValidAgentId(agentId);
    if(!result){
      state = const LoginState.agentIdError('SU_agent_id_error_text');
    }else {
      state = const LoginState.agentIdError('');
    }
    return result;
  }

  Future navigateToWelcomeBackScreen(String userType ,String mobilNumber) async {
    if(userType == 'Customer'){
      // _navigationHandler.navigateToOtpScreen(userType, mobilNumber);
    }else{
      _navigationHandler.navigateToOtpScreenForAgent(userType,mobilNumber);
    }
  }

  Future<void> navigateToResetNow(String userType) async{
    await _navigationHandler.navigateToResetPasscode(userType);
  }

  Future customerLogin(String mobileNumber,String passcode, String userType)async{
   var response = await _loginUseCase.login('+255'+mobileNumber, passcode, (p0) => null);
   if(response?.status == true){
     _navigationHandler.navigateToOtpScreen(userType, mobileNumber, response!.data!.id!);
   }else{
     print(response?.message);
   }
  }
}