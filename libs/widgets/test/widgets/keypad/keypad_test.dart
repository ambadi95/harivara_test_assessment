import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/keypad/keypad.dart';

void main() {
  late Widget testWidget;

  int count = 0;

  setUp(() {
    count = 0;
    testWidget = MaterialApp(
      home: Scaffold(
        body: KeyPad((keypadButtonType) {
          count++;
        }),
      ),
    );
  });

  final backspaceIconFinder = find.byKey(const Key('backspaceIcon'));

  testWidgets('should show all relevant widgets', (tester) async {
    // Arrange
    final decimalTextFinder = find.byKey(const Key('decimalText'));
    final digitTextFinder = find.byKey(const Key('digitText'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(backspaceIconFinder, findsOneWidget);
    expect(decimalTextFinder, findsOneWidget);
    expect(digitTextFinder, findsNWidgets(10));
  });

  testWidgets('make sure callback is called when button is pressed',
      (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(backspaceIconFinder);
    // Assert
    expect(count, 1);
  });
}
