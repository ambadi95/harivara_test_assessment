
import 'package:core/view/analytics_state_notifier.dart';
import '../navigation_handler/login_navigation_handler.dart';
import '../state/login_state.dart';
import 'login_usecase.dart';

class LoginCoordinator extends AnalyticsStateNotifier<LoginState>{

  final LoginNavigationHandler _navigationHandler;
  final LoginUseCase _loginUseCase;

  LoginCoordinator(this._navigationHandler,
      this._loginUseCase,) : super(const LoginState());

  void validateForm(String mobNumber, String passcode){
    var mobileNo = _loginUseCase.isValidMobileNumber(mobNumber);
    var passCode = passcode.length == 6;
    bool isValid = mobileNo && passCode;
    state =LoginState.loginFormState(isValid);
  }

  bool isMobileNumberValid(String mobileNumber){
    var result = _loginUseCase.isValidMobileNumber(mobileNumber);
    if(!result){
      state = const LoginState.mobileNumberError('SU_subtitle_error_text');
    }else {
      state = const LoginState.mobileNumberError('');
    }
    return result;
  }

  Future navigateToWelcomeBackScreen() async {
    _navigationHandler.navigateToOtpScreen();

  }
}