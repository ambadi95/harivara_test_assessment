import 'package:freezed_annotation/freezed_annotation.dart';

part 'passcode_response_message.freezed.dart';

@freezed
class PasscodeResponseMessage with _$PasscodeResponseMessage {
  const PasscodeResponseMessage._();

  factory PasscodeResponseMessage.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'login success':
        return PasscodeResponseMessage.loginSuccess();
      default:
        return PasscodeResponseMessage.loginFailed();
    }
  }

  const factory PasscodeResponseMessage.loginSuccess() =
      PasscodeMessageLoginSuccess;
    
  const factory PasscodeResponseMessage.loginFailed() =
      PasscodeMessageLoginFailed;

  @override
  String toString() {
    return maybeWhen(
      loginSuccess: () => 'Login Success',
      loginFailed: () => 'Login Failed',
      orElse: () => 'unknown',
    );
  }
}
