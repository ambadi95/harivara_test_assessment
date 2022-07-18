import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/input_fields/obscured_digit_entry_input_field.dart';
import 'package:widget_library/input_fields/obscured_field.dart';

void main() {
  late Widget testWidget;

  testWidgets('should have allWidgetsPresent', (tester) async {
    // Arrange
    final rowFinder = find.byKey(const Key('row'));
    final inputFieldFinder = find.byType(ObscuredField);
    const numOfChars = 3;
    testWidget = testWidget = MaterialApp(
      home: Scaffold(
        body: ObscuredDigitEntryInputField(numOfChars, ''),
      ),
    );
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(rowFinder, findsOneWidget);
    expect(inputFieldFinder, findsNWidgets(numOfChars));
  });
}
