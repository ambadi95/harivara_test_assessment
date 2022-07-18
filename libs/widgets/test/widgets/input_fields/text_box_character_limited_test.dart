import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/input_fields/text_box_character_limited.dart';

void main() {
  late Widget testWidget;

  final maxCharacters = 10;
  late String currentValueReturned;

  setUp(() {
    currentValueReturned = '';
    testWidget = MaterialApp(
      home: Scaffold(
        body: TextBoxCharacterLimited(
          title: 'title',
          maxCharacters: maxCharacters,
          onTextChangedCallback: (value) {
            currentValueReturned = value;
          },
        ),
      ),
    );
  });

  final textFieldFinder = find.byKey(const Key('text-field'));

  testWidgets('should have all required widgets', (tester) async {
    // Arrange
    final titleFinder = find.byKey(const Key('title'));
    final countValueFinder = find.byKey(const Key('count-value'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(titleFinder, findsOneWidget);
    expect(countValueFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
  });

  testWidgets('should return correct text', (tester) async {
    // Arrange
    const textToInput = 'text value';
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(textFieldFinder);
    await tester.enterText(textFieldFinder, textToInput);
    await tester.pump();
    // Assert
    expect(currentValueReturned, textToInput);
  });

  testWidgets('should not go over maxChars', (tester) async {
    // Arrange
    const textToInput = 'text value which is far too long';
    expect(textToInput.length > maxCharacters, true);
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(textFieldFinder);
    await tester.enterText(textFieldFinder, textToInput);
    await tester.pump();
    // Assert
    expect(currentValueReturned.length, maxCharacters);
  });
}
