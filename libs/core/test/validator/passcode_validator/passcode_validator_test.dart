import 'package:core/validators/passcode_validator/passcode_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

void main() {
  late PasscodeHandler passcodeHandler;

  setUp(() {
    passcodeHandler = PasscodeHandlerImpl();
  });

  group('[PasscodeHandler] - updateAndValidatePasscode() -', () {
    test('should update passcode', () async {
      // Arrange
      const keypadButtonType = KeypadButtonType.digit(3);
      const currentPasscode = '';
      const passcodeLimit = 6;
      // Act
      final result = passcodeHandler.updateAndValidatePasscode(
        keypadButtonType,
        currentPasscode,
        passcodeLimit,
      );
      // Assert
      expect(result.passcode, '3');
      expect(result.isComplete, false);
    });

    test('should return isComplete', () async {
      // Arrange
      const keypadButtonType = KeypadButtonType.digit(3);
      const currentPasscode = '12345';
      const passcodeLimit = 6;
      // Act
      final result = passcodeHandler.updateAndValidatePasscode(
        keypadButtonType,
        currentPasscode,
        passcodeLimit,
      );
      // Assert
      expect(result.passcode, '123453');
      expect(result.isComplete, true);
    });

    test('should not return isComplete when backSpace is triggered', () async {
      // Arrange
      const keypadButtonType = KeypadButtonType.backspace();
      const currentPasscode = '123456';
      const passcodeLimit = 6;
      // Act
      final result = passcodeHandler.updateAndValidatePasscode(
        keypadButtonType,
        currentPasscode,
        passcodeLimit,
      );
      // Assert
      expect(result.passcode, '12345');
      expect(result.isComplete, false);
    });

    test('should do nothing when KeypadButtonType.none()', () async {
      // Arrange
      const keypadButtonType = KeypadButtonType.none();
      const currentPasscode = '12345';
      const passcodeLimit = 6;
      // Act
      final result = passcodeHandler.updateAndValidatePasscode(
        keypadButtonType,
        currentPasscode,
        passcodeLimit,
      );
      // Assert
      expect(result.passcode, '12345');
      expect(result.isComplete, false);
    });

    test('should do nothing when KeypadButtonType.decimalPoint()', () async {
      // Arrange
      const keypadButtonType = KeypadButtonType.decimalPoint();
      const currentPasscode = '12345';
      const passcodeLimit = 6;
      // Act
      final result = passcodeHandler.updateAndValidatePasscode(
        keypadButtonType,
        currentPasscode,
        passcodeLimit,
      );
      // Assert
      expect(result.passcode, '12345');
      expect(result.isComplete, false);
    });
  });
}
