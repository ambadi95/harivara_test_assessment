import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState{
  const factory SignUpState.initialState() = InitialState;

  const factory SignUpState.SignUpFormState(
      bool isValid,
      ) = SignUpFormState;
}