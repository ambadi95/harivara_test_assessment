import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_library/cards/add_card_holder.dart';

void main() {
  testWidgets('CrayonPaymentAddCardHolder WidgetTest',
      (WidgetTester tester) async {
    final addCardHolderFinder =
        find.byKey(const Key('CrayonPaymentAddCardHolder_AddCardHolder'));
    final addCardHolderRowFinder =
        find.byKey(const Key('CrayonPaymentAddCardRow_AddCardRow'));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CrayonPaymentAddCardHolder(
            text: 'Add new card',
          ),
        ),
      ),
    );

    expect(addCardHolderFinder, findsOneWidget);
    expect(addCardHolderRowFinder, findsOneWidget);
  });
}
