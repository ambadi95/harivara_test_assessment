import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/keypad/keypad_button.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

void main() {
  late Widget testWidget;

  group('making sure that the correct child widgets are shown', () {
    // Finders
    final digitTextFinder = find.byKey(const Key('digitText'));
    final backspaceIconFinder = find.byKey(const Key('backspaceIcon'));
    final decimalTextFinder = find.byKey(const Key('decimalText'));

    testWidgets(
        'should have correct number shown when keypadButtonType is a digit',
        (tester) async {
      // Arrange
      const number = 6;
      const keypadButtonTypeDigit = KeypadButtonType.digit(number);
      // Act
      testWidget = MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              KeypadButton(
                keypadButtonTypeDigit,
                (keypadButtonType) {},
              )
            ],
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      // Assert
      expect(digitTextFinder, findsOneWidget);
      expect(backspaceIconFinder, findsNothing);
      expect(decimalTextFinder, findsNothing);
    });

    testWidgets(
        'should have backspace icon showing when keypadButtonType is a backspace',
        (tester) async {
      // Arrange
      const keypadButtonTypeBackspace = KeypadButtonType.backspace();
      // Act
      testWidget = MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              KeypadButton(keypadButtonTypeBackspace, (keypadButtonType) {})
            ],
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      // Assert
      expect(digitTextFinder, findsNothing);
      expect(backspaceIconFinder, findsOneWidget);
      expect(decimalTextFinder, findsNothing);
    });

    testWidgets(
        'should have "." showing when keypadButtonType is a decimalPoint',
        (tester) async {
      // Arrange
      const keypadButtonTypeDecimal = KeypadButtonType.decimalPoint();
      // Act
      testWidget = MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              KeypadButton(keypadButtonTypeDecimal, (keypadButtonType) {})
            ],
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      // Assert
      expect(digitTextFinder, findsNothing);
      expect(backspaceIconFinder, findsNothing);
      expect(decimalTextFinder, findsOneWidget);
    });

    testWidgets('should have "should be empty"', (tester) async {
      // Arrange
      const keypadButtonTypeDecimal = KeypadButtonType.none();
      // Act
      testWidget = MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              KeypadButton(keypadButtonTypeDecimal, (keypadButtonType) {})
            ],
          ),
        ),
      );
      await tester.pumpWidget(testWidget);
      // Assert
      expect(digitTextFinder, findsNothing);
      expect(backspaceIconFinder, findsNothing);
      expect(decimalTextFinder, findsOneWidget);
    });
  });

  testWidgets('make sure callback is called when button is pressed',
      (tester) async {
    // Arrange
    int count = 0;
    final keypadButtonFinder = find.byKey(const Key('keypadButton-1'));
    testWidget = MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            KeypadButton(KeypadButtonType.digit(1), (keypadButtonType) {
              count += 1;
            })
          ],
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(keypadButtonFinder);

    // Assert
    expect(count, 1);
  });
}
