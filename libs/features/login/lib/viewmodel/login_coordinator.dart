
import 'package:core/view/analytics_state_notifier.dart';
import '../navigation_handler/login_navigation_handler.dart';
import '../state/login_state.dart';
import 'login_usecase.dart';

class LoginCoordinator extends AnalyticsStateNotifier<LoginState>{

  final LoginNavigationHandler _navigationHandler;
  final LoginUseCase _agentNearbyUseCase;

  LoginCoordinator( this._navigationHandler,
      this._agentNearbyUseCase,) : super(const LoginState());
}