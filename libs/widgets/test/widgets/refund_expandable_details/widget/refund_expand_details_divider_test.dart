import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_expand_details_divider.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: RefundExpandDetailsDivider(),
      ),
    );
  });

  testWidgets('should have required key', (tester) async {
    // Arrange
    final dividerFinder = find.byKey(const Key('expand_details_divider'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(dividerFinder, findsOneWidget);
  });
}
