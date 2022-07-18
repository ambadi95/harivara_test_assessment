import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';
import 'package:widget_library/keypad/utils/keypad_button_pressed_value_updater.dart';

void main() {
  late KeyPadButtonPressedValueUpdater valueUpdater;

  setUp(() {
    valueUpdater = KeyPadButtonPressedValueUpdaterImpl();
  });

  group('updateValue', () {
    test('should not allow two consecutive decimal points', () async {
      // Arrange
      const previousAmount = '20.';
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.decimalPoint(),
        previousAmount,
      );
      // Assert
      expect(newAmount, previousAmount);
    });

    test('should not allow two nonconsecutive decimal points', () async {
      // Arrange
      const previousAmount = '20.1';
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.decimalPoint(),
        previousAmount,
      );
      // Assert
      expect(newAmount, previousAmount);
    });

    test('should append digit', () async {
      // Arrange
      const previousAmount = '20.1';
      const newDigit = 2;
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.digit(newDigit),
        previousAmount,
      );
      // Assert
      expect(newAmount, '$previousAmount${newDigit.toString()}');
    });

    test('should remove digit', () async {
      // Arrange
      const previousAmount = '20.1';
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.backspace(),
        previousAmount,
      );
      // Assert
      expect(newAmount, previousAmount.substring(0, previousAmount.length - 1));
    });

    testWidgets('should have zero', (tester) async {
      // Arrange
      const previousAmount = '0';
      const newDigit = 0;
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.digit(newDigit),
        previousAmount,
      );
      // Assert
      expect(newAmount, previousAmount);
    });

    testWidgets('it should contain new value', (tester) async {
      // Arrange
      const previousAmount = '0';
      const newDigit = 2;
      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.digit(newDigit),
        previousAmount,
      );
      // Assert
      expect(newAmount, newDigit.toString());
    });

    testWidgets('it should not contain any value', (tester) async {
      // Arrange
      const previousAmount = '0';

      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.none(),
        previousAmount,
      );
      // Assert
      expect(newAmount, previousAmount);
    });

    testWidgets('should have decimal', (tester) async {
      // Arrange
      const previousAmount = '0';

      // Act
      final newAmount = valueUpdater.updateValue(
        KeypadButtonType.decimalPoint(),
        previousAmount,
      );
      // Assert
      expect(newAmount, '$previousAmount.');
    });
  });
}
