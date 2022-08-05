import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:widget_library/cards/card_details_holder.dart';
import 'package:widget_library/carousels/cards_carousel.dart';

void main() {
  final file = File('test/widgets/carousels/list_of_cards_data.json');
  final dataAsString = file.readAsStringSync();
  final dataAsJson = json.decode(dataAsString);
  final cardMaps = dataAsJson['cardDetails'];
  late List<CardWallet> listOfCards;
  late List<CrayonPaymentCardDetailsHolder> listOfCardWidgets;

  if (cardMaps != null) {
    listOfCards = List<CardWallet>.from(
      cardMaps.map(
        (cardMap) => CardWallet.fromJson(cardMap as Map<String, dynamic>),
      ) as Iterable<dynamic>,
    );

    listOfCardWidgets = <CrayonPaymentCardDetailsHolder>[
      CrayonPaymentCardDetailsHolder(
        cardDetails: listOfCards.elementAt(0),
      ),
      CrayonPaymentCardDetailsHolder(
        cardDetails: listOfCards.elementAt(1),
      ),
    ];
  }

  testWidgets(
      '[CrayonPaymentCardsCarousel] - check that list of cards has two widgets',
      (WidgetTester tester) async {
    expect(listOfCardWidgets.length, 2);
  });

  testWidgets(
      '[CrayonPaymentCardsCarousel] - check existence of all components',
      (WidgetTester tester) async {
    final String _identifier = 'CrayonPaymentCardsCarousel';

    final cardsCarouselFinder = find.byKey(Key(_identifier));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: buildCrayonPaymentCardsCarousel(
            listOfCards: listOfCardWidgets,
          ),
        ),
      ),
    );

    expect(cardsCarouselFinder, findsOneWidget);
  });
}
