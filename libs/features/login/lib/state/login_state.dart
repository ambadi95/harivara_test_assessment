import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/login_model/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {

 const factory LoginState({
   @Default([]) List<LoginModel> loginList,
}) = _LoginState;

  const factory LoginState.mobileNumberError(
      String mobileNumberError
      ) = MobileNumberError;

 const factory LoginState.loginFormState(
     bool isValid
     ) = LoginFormState;

}