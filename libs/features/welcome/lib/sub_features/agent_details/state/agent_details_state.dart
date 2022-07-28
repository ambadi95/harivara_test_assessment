import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_details_state.freezed.dart';

@freezed
class AgentDetailsState with _$AgentDetailsState{
  const factory AgentDetailsState.initialState() = InitialState;

  const factory AgentDetailsState.DetailsFormState(
      bool isValid
      ) = DetailsFormState;

  const factory AgentDetailsState.nameError(
      String nameError
      ) = NameError;

  const factory AgentDetailsState.mobileError(
      String mobileError
      ) = MobileError;

  const factory AgentDetailsState.emailError(
      String emailError
      ) = EmailError;


  const factory AgentDetailsState.dobError(
      String dobError
      ) = DobError;

  const factory AgentDetailsState.genderError(
      String genderError
      ) = GenderError;
}