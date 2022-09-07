import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/agent_nearby/agent_nearby_model.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_response/datum.dart';
part 'agent_nearby_state.freezed.dart';

@freezed
class AgentNearByState with _$AgentNearByState {
  const factory AgentNearByState({
    @Default([]) List<Datum> agentNearbyList,
    @Default(false) bool isLoading,
    @Default(false) bool isFetchingLocation,
    @Default(false) bool isLocationVerified,
    @Default('') String locationError,
  }) = _AgentNearByState;
}
