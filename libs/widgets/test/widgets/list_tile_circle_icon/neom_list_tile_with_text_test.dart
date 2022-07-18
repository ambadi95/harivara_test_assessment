import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_list_tile_with_text.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: CrayonPaymentListTileWithHighlightText(
          'Title',
          'SubTitle',
        ),
      ),
    );
  });

  testWidgets('[CrayonPaymentListTileWithHighlightText] - finds all widgets',
      (tester) async {
    // Arrange
    final titleFinder = find.byKey(Key('title'));
    final subtitleFinder = find.byKey(Key('subtitle'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });
}
