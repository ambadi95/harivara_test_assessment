import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_info_line.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: ExpandDetailsInfoLine(
          leftSideString: 'leftSide',
          rightSideWidget: Text('rightSide'),
        ),
      ),
    );
  });

  testWidgets('should have all relevant widgets', (tester) async {
    // Arrange
    final crayonPaymentTextFinder = find.byType(CrayonPaymentText);
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(crayonPaymentTextFinder, findsOneWidget);
  });
}
