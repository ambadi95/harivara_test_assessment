import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_enrollment_state.freezed.dart';

@freezed
class AgentEnrollmentState with _$AgentEnrollmentState{
  const factory AgentEnrollmentState.initialState() = InitialState;
}