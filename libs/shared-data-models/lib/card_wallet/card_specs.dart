import 'package:shared_data_models/card_wallet/card_brand.dart';

class CardSpecs {
  final int numberMinLength;
  final int numberMaxLength;
  final int cvvLength;

  const CardSpecs._({
    required this.numberMinLength,
    required this.numberMaxLength,
    required this.cvvLength,
  });

  factory CardSpecs.from(CardBrand type) => type.maybeWhen(
        dinersInternational: () {
          return CardSpecs._(
            numberMinLength: 14,
            numberMaxLength: 19,
            cvvLength: 3,
          );
        },
        chinaUnionPay: () {
          return CardSpecs._(
            numberMinLength: 16,
            numberMaxLength: 19,
            cvvLength: 3,
          );
        },
        amex: () {
          return CardSpecs._(
            numberMinLength: 15,
            numberMaxLength: 15,
            cvvLength: 4,
          );
        },
        orElse: () {
          return CardSpecs._(
            numberMinLength: 16,
            numberMaxLength: 16,
            cvvLength: 3,
          );
        },
      );
}
