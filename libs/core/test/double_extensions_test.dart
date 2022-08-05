import 'package:flutter_test/flutter_test.dart';
import 'package:core/utils/extensions/double_extentions.dart';

void main() {
  testDoubleToAmount();
}

void testDoubleToAmount() {
  test('100.10 to 100.10 AED', () {
    expect(100.10.toAmount(symbol: 'AED'), equals('AED 100.10'));
  });

  test('100000000.10 to GBP 100,000,000.10', () {
    expect(100000000.10.toAmount(symbol: 'GBP'), equals('GBP 100,000,000.10'));
  });

  test('100000000.10 to 100,000,000.10 GBP', () {
    expect(100000000.10.toAmount(symbol: 'GBP', putSymbolFirst: false),
        equals('100,000,000.10 GBP'));
  });

  test('123456.99 to 123,456.99', () {
    expect(123456.99.toAmount(), equals('123,456.99'));
  });
}
