import 'package:widget_library/keypad/keypad_button_type.dart';

class PassCodeViewModel {
  int get _validPasscodeLength => 6;

  bool validPasscode(String passcode) {
    var isValidLength = _validatePasscodeLength(passcode);
    var isValidSequence = _validateSequence(passcode);
    var isValidConsecutive = _validateConsecutive(passcode);
    var isRepeating = _validateRepeating(passcode);
    return isValidLength &&
        !isValidSequence &&
        !isValidConsecutive &&
        !isRepeating;
  }

  String updateCurrentPasscode(
    KeypadButtonType keypadButtonType,
    String previousPasscode,
    int passcodeLength,
  ) {
    return keypadButtonType.when(
      digit: (number) {
        var isIncomplete = _validatePasscode(previousPasscode, passcodeLength);
        var currentPasscode = previousPasscode;
        if (isIncomplete) {
          currentPasscode += number.toString();
        }
        return currentPasscode;
      },
      backspace: () {
        return previousPasscode.isNotEmpty
            ? previousPasscode.substring(0, previousPasscode.length - 1)
            : '';
      },
      decimalPoint: () {
        return previousPasscode;
      },
      none: () {
        return previousPasscode;
      },
    );
  }

  bool _validatePasscode(String number, int cvvLength) {
    return number.length < cvvLength ? true : false;
  }

  bool _validatePasscodeLength(String passcode) {
    return passcode != '' && passcode.length == _validPasscodeLength;
  }

  bool _validateSequence(String passcode) {
    var valid = [];
    for (int i = 0; i < passcode.length; i++) {
      valid.add(passcode[i]);
    }
    for (int i = 0; i < valid.length; i++) {
      for (int j = i + 1; j < valid.length; j++) {
        if (valid[i] == valid[j]) {
          for (int k = j + 1; k < valid.length; k++) {
            if (valid[j] == valid[k]) {
              return true;
            } else {
              return false;
            }
          }
        }
      }
    }
    return false;
  }

  bool _validateConsecutive(String passcode) {
    var valid = [];

    for (int i = 0; i < passcode.length; i++) {
      valid.add(passcode[i]);
    }

    int sumCheck = int.parse(valid[1]) - int.parse(valid[0]);
    int sumCheck2 = int.parse(valid[2]) - int.parse(valid[1]);
    int sumCheck3 = int.parse(valid[3]) - int.parse(valid[2]);

    if ((sumCheck == 1 && sumCheck2 == 1 && sumCheck3 == 1) ||
        (sumCheck == 0 && sumCheck2 == 0 && sumCheck3 == 0) ||
        (sumCheck == -1 && sumCheck2 == -1 && sumCheck3 == -1)) {
      return true;
    } else {
      return false;
    }
  }

  bool _validateRepeating(String password) {
    var valid = [];

    for (int i = 0; i < password.length; i++) {
      valid.add(password[i]);
    }

    if (valid[0] == valid[2] &&
        valid[2] == valid[4] &&
        valid[1] == valid[3] &&
        valid[3] == valid[5]) {
      return true;
    } else {
      return false;
    }
  }
}
