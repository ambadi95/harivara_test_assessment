import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/buttons/crayon_payment_back_button.dart';

void main() {
  testWidgets('Testing IconButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CrayonPaymentBackButton(
            customIcon: Icons.arrow_back,
            size: 13,
            color: Colors.black,
          ),
        ),
      ),
    );

    final iconButtonFinder = find.byKey(Key('BackArrowButton_IconButton'));
    final iconButton = find.byKey(Key('BackArrowButtonIcon'));

    expect(iconButtonFinder, findsOneWidget);
    expect(iconButton, findsOneWidget);
    expect((tester.firstWidget(find.byType(Icon)) as Icon).size, 13);
    expect((tester.firstWidget(find.byType(Icon)) as Icon).color, Colors.black);
  });
}
