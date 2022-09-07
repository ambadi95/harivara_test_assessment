import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/login_model/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.mobileNumberError(String mobileNumberError) =
      MobileNumberError;

  const factory LoginState.loading() = LoadingState;

  const factory LoginState.initialState() = InitialState;

  const factory LoginState.successState() = SuccessState;

  const factory LoginState.agentIdError(String agentIdError) = AgentIdError;

  const factory LoginState.loginFormState(bool isValid) = LoginFormState;

  const factory LoginState.showPasscode(bool havePasscode) = ShowPasscode;

}
