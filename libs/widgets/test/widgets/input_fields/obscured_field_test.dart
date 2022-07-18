import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/input_fields/obscured_field.dart';
import 'package:flutter/material.dart';

void main() {
  late Widget testWidget;
  bool focus = true;
  const val = '123';

  testWidgets('should show the text form field widget', (tester) async {
    //Arrange
    final textFinder = find.textContaining(val);
    final formFieldFinder = find.byKey(const Key('field-text'));
    testWidget = MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            ObscuredField(value: val, shouldBeFocused: focus),
          ],
        ),
      ),
    );
    //Act
    await tester.pumpWidget(testWidget);
    //Assert
    expect(textFinder, findsOneWidget);
    expect(formFieldFinder, findsOneWidget);
  });
}
