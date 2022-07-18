import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/buttons/icon_text_button.dart';
import 'package:dartz/dartz.dart';

void main() {
  testWidgets('[IconTextButton] - check existence of all components',
      (WidgetTester tester) async {
    String _identifier = 'CrayonPaymentIconTextButton';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CrayonPaymentIconTextButton(
            customIcon: Left(Icons.access_alarm),
            text: 'IconTextButton',
          ),
        ),
      ),
    );

    final iconFinder = find.byKey(Key('${_identifier}_Icon'));
    final textFinder = find.byKey(Key('${_identifier}_Text'));

    expect(iconFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });
}
