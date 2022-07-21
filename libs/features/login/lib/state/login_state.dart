import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/login_model/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {

 const factory LoginState({
   @Default([]) List<LoginModel> loginList,
}) = _LoginState;
}