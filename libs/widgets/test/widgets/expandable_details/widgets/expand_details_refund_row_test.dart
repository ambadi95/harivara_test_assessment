import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_refund_row.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: ExpandDetailsRefundRow(
          'xxxxxxx',
          '22/07/2021',
          '10.0',
          () => () {},
          120,
        ),
      ),
    );
  });

  testWidgets('should have all relevant widgets', (tester) async {
    // Arrange
    final CrayonPaymentTextFinder = find.byType(CrayonPaymentText);
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(CrayonPaymentTextFinder, findsNWidgets(5));
  });
}
