import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/search_bar/search_bar_with_icon.dart';

void main() {
  late Widget testWidget;
  String? enteredText;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarWithIcon(
          onTextChanged: (value) {
            enteredText = value;
          },
        ),
      ),
    );
  });

  tearDown(() {
    enteredText = null;
  });

  testWidgets('should find required widgets', (tester) async {
    // Arrange
    final searchBarFinder = find.byKey(const Key('search-bar-with-icon'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(searchBarFinder, findsOneWidget);
  });

  testWidgets('should call callback', (tester) async {
    // Arrange
    final textFieldFinder = find.byKey(const Key('SearchBarWidget_TextField'));
    const text = 'text';
    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textFieldFinder, text);
    // For debouncer we pump
    await tester.pump(Duration(seconds: 1));
    // Assert
    expect(enteredText, text);
  });
}
