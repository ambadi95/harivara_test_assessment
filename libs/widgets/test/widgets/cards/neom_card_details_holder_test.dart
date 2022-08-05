import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:widget_library/cards/card_details_holder.dart';

void main() {
  final file = File('test/widgets/cards/card_wallet_data.json');
  final dataAsString = file.readAsStringSync();
  final dataAsJson = json.decode(dataAsString);
  final cardDetails = CardWallet.fromJson(dataAsJson as Map<String, dynamic>);
  testWidgets(
      '[CrayonPaymentCardDetailsHolder] - check existence of all components',
      (WidgetTester tester) async {
    final String _identifier = 'CrayonPaymentCardDetailsHolder';

    final cardHolderFinder = find.byKey(Key(_identifier));
    final cardHolderNickNameFinder = find.byKey(Key('${_identifier}_NickName'));
    final cardHolderNumberFinder = find.byKey(Key('${_identifier}_Number'));
    final cardHoldeExpiryDateFinder =
        find.byKey(Key('${_identifier}_ExpiryDate'));
    final cardHoldeCardTypeFinder = find.byKey(Key('${_identifier}_CardType'));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CrayonPaymentCardDetailsHolder(
            cardDetails: cardDetails,
          ),
        ),
      ),
    );

    expect(cardHolderFinder, findsOneWidget);
    expect(cardHolderNickNameFinder, findsOneWidget);
    expect(cardHolderNumberFinder, findsOneWidget);
    expect(cardHoldeExpiryDateFinder, findsOneWidget);
    expect(cardHoldeCardTypeFinder, findsOneWidget);
  });
}
