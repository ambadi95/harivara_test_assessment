import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

class Wallet {
  final List<CardWallet>? cards;
  final Amount balance;
  final int walletId;
  final String limit;

  Wallet(
    this.cards,
    this.balance,
    this.walletId,
    this.limit,
  );

  factory Wallet.fromJson(Map<String, dynamic> json) {
    final cardMaps = json['cardDetails'];
    List<CardWallet>? allCards;

    if (cardMaps != null) {
      allCards = List<CardWallet>.from(
        cardMaps.map(
          (cardMap) => CardWallet.fromJson(cardMap as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      );

      if (allCards.isEmpty) {
        allCards = null;
      }
    }
    return Wallet(
      allCards,
      Amount.fromJson(json['balance'] as Map<String, dynamic>),
      json['walletId'] as int,
      json['limit'] as String,
    );
  }
}
