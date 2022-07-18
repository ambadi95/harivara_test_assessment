import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_expand_details_info_line.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: RefundExpandDetailsInfoLine(
          leftSide: 'leftSide',
          rightSide: 'rightSide',
          middle1: 'middle1',
          middle2: 'middle2',
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
    expect(CrayonPaymentTextFinder, findsNWidgets(4));
  });
}
