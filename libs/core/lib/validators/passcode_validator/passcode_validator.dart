import 'package:core/validators/passcode_validator/passcode_handler_return.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

abstract class PasscodeHandler {
  PasscodeHandlerReturn updateAndValidatePasscode(
    KeypadButtonType keypadButtonType,
    String currentPasscode,
    int passcodeLimit,
  );
}

class PasscodeHandlerImpl implements PasscodeHandler {
  @override
  PasscodeHandlerReturn updateAndValidatePasscode(
    KeypadButtonType keypadButtonType,
    String currentPasscode,
    int passcodeLimit,
  ) {
    String newPasscode = currentPasscode;
    bool isComplete = false;

    keypadButtonType.maybeWhen(
      digit: (number) {
        isComplete = _validatePasscode(currentPasscode, passcodeLimit);

        if (!isComplete) {
          newPasscode += number.toString();
        }
      },
      backspace: () {
        if (newPasscode.isNotEmpty) {
          newPasscode = newPasscode.substring(0, newPasscode.length - 1);
        }
      },
      orElse: () => null,
    );
    isComplete = _validatePasscode(newPasscode, passcodeLimit);
    return PasscodeHandlerReturn(newPasscode, isComplete);
  }

  bool _validatePasscode(String currentPasscode, int passcodeLimit) {
    return currentPasscode.length == passcodeLimit ? true : false;
  }
}
