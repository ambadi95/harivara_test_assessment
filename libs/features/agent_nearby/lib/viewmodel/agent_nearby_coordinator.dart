
import 'package:core/view/analytics_state_notifier.dart';

import '../navigation_handler/agent_nearby_navigation_handler.dart';
import '../state/agent_nearby_state.dart';
import 'agent_nearby_usecase.dart';

class AgentNearbyCoordinator extends AnalyticsStateNotifier<AgentNearByState>{

  final AgentNearbyNavigationHandler _navigationHandler;
  final AgentNearbyUseCase _agentNearbyUseCase;

  AgentNearbyCoordinator( this._navigationHandler,
      this._agentNearbyUseCase,) : super(const AgentNearByState());
}