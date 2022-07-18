import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_type.freezed.dart';

@freezed
class CardType with _$CardType {
  const CardType._();

  factory CardType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'debit':
        return CardType.debit();
      case 'credit':
        return CardType.credit();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory CardType.debit() = DebitCard;

  const factory CardType.credit() = CreditCard;

  @override
  String toString() {
    return when(
      debit: () => 'debit',
      credit: () => 'credit',
    );
  }
}
