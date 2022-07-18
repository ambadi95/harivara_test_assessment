import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:widget_library/cards/row_card.dart';

void main() {
  final file = File('test/widgets/cards/card_wallet_data.json');
  final dataAsString = file.readAsStringSync();
  final dataAsJson = json.decode(dataAsString);
  final cardDetails = CardWallet.fromJson(dataAsJson as Map<String, dynamic>);
  testWidgets('CrayonPaymentRowCard WidgetTest', (WidgetTester tester) async {
    final rowCardFinder = find.byKey(const Key('CrayonPaymentRowCard_RowCard'));
    final rowCardIconFinder =
        find.byKey(const Key('CrayonPaymentRowCardIcon_RowCardIcon'));
    final rowCardTitlesFinder =
        find.byKey(const Key('CrayonPaymentRowCardTitles_RowCardTitles'));
    final rowCardArrowFinder =
        find.byKey(const Key('CrayonPaymentRowCardArrow_RowCardArrow'));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CrayonPaymentRowCard(
              cardDetails: cardDetails,
              isSelected: true,
            ),
          ),
        ),
      );
    });

    expect(rowCardFinder, findsOneWidget);
    expect(rowCardIconFinder, findsOneWidget);
    expect(rowCardTitlesFinder, findsOneWidget);
    expect(rowCardArrowFinder, findsOneWidget);
  });
}
