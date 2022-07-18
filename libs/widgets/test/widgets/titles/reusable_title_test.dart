import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/titles/reusable_title.dart';

void main() {
  testWidgets('Testing ReusableTitle', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ReusableTitle(text: 'HelloCrayonPayment'),
        ),
      ),
    );

    final reusableTitleFinder = find.byKey(Key('ReusableTitle'));

    expect(reusableTitleFinder, findsOneWidget);
  });
}
