import 'package:task_manager/base_classes/base_view_model.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import '../state/agent_enrollment_state.dart';

class AgentEnrollmentCoordinator extends BaseViewModel<AgentEnrollmentState> {
  final WelcomeNavigationHandler _navigationHandler;

  AgentEnrollmentCoordinator(this._navigationHandler)
      : super(const AgentEnrollmentState.initialState());

  Future navigateToAgentHome() async {
    _navigationHandler.navigateToAgentEnrollmentBottomSheet("da");
  }
}
