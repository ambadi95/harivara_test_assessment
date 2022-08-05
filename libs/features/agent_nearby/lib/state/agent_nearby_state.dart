import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/agent_nearby/agent_nearby_model.dart';

part 'agent_nearby_state.freezed.dart';

@freezed
class AgentNearByState with _$AgentNearByState {
  const factory AgentNearByState({
    @Default([]) List<AgentNearbyModel> agentNearbyList,
  }) = _AgentNearByState;
}
