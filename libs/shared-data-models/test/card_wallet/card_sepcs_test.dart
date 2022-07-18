import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_brand.dart';
import 'package:shared_data_models/card_wallet/card_specs.dart';

void main() {
  test('[CardSpecs] - check constructor - processing', () {
    CardSpecs specs = CardSpecs.from(CardBrand.processing());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - visa', () {
    CardSpecs specs = CardSpecs.from(CardBrand.visa());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - mastercard', () {
    CardSpecs specs = CardSpecs.from(CardBrand.mastercard());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - mastercard', () {
    CardSpecs specs = CardSpecs.from(CardBrand.chinaUnionPay());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(19));
  });

  test('[CardSpecs] - check constructor - amex', () {
    CardSpecs specs = CardSpecs.from(CardBrand.amex());
    expect(specs.cvvLength, equals(4));
    expect(specs.numberMinLength, equals(15));
    expect(specs.numberMaxLength, equals(15));
  });

  test('[CardSpecs] - check constructor - diners USA', () {
    CardSpecs specs = CardSpecs.from(CardBrand.dinersUSA());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - diners International', () {
    CardSpecs specs = CardSpecs.from(CardBrand.dinersInternational());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(14));
    expect(specs.numberMaxLength, equals(19));
  });

  test('[CardSpecs] - check constructor - mada', () {
    CardSpecs specs = CardSpecs.from(CardBrand.mada());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - mada mastercard', () {
    CardSpecs specs = CardSpecs.from(CardBrand.madaMasterCard());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });

  test('[CardSpecs] - check constructor - mada visa', () {
    CardSpecs specs = CardSpecs.from(CardBrand.madaVisa());
    expect(specs.cvvLength, equals(3));
    expect(specs.numberMinLength, equals(16));
    expect(specs.numberMaxLength, equals(16));
  });
}
