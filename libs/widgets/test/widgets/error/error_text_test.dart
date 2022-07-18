import 'package:widget_library/error/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late Widget testWidget;

  final errorTextFinder = find.byKey(const Key('errorText'));
  final sizedBoxFinder = find.byKey(const Key('sizedBox'));

  testWidgets('should show TextWidget if provided in constructor', (tester) async {
    // Arrange
    const text = 'text';
    testWidget = const MaterialApp(
      home: ErrorText(text),
    );
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(errorTextFinder, findsOneWidget);
    expect(sizedBoxFinder, findsNothing);
  });

  testWidgets('should not show TextWidget when null passed in constructor', (tester) async {
    // Arrange
    testWidget = const MaterialApp(
      home: ErrorText(null),
    );
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(errorTextFinder, findsNothing);
    expect(sizedBoxFinder, findsOneWidget);
  });

  testWidgets('should show correct message', (tester) async {
    // Arrange
    const errorMessage = 'invalid input';
    final textFinder = find.text(errorMessage);
    testWidget = const MaterialApp(
      home: ErrorText(errorMessage),
    );
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(textFinder, findsOneWidget);
  });
}
