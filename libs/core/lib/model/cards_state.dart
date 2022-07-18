import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_state.freezed.dart';

@freezed
class CardsState with _$CardsState {
  factory CardsState.noCards() = NoCards;

  factory CardsState.existingCards() = ExistingCards;

  factory CardsState.cardsDeleted() = CardsDeleted;

  factory CardsState.cardScanned(
      String number, int month, int year, bool hasCards) = CardsScanned;
}
