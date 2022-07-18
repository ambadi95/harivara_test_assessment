import 'package:flutter_test/flutter_test.dart';
import 'package:core/utils/extensions/string_extensions.dart';

void main() {
  testIsNullOrEmpty();

  testStringAmountToDouble();

  testStringAmountToString();
}

void testIsNullOrEmpty() {
  test('pass null value', () {
    final String? arg = null;
    expect(arg.isNullOrEmpty(), true);
  });

  test('pass empty value', () {
    final String? arg = '';
    expect(arg.isNullOrEmpty(), true);
  });

  test('pass some value', () {
    final String? arg = 'test';
    expect(arg.isNullOrEmpty(), false);
  });
}

void testStringAmountToDouble() {
  test('GBP 100.10 to double', () {
    expect('GBP 100.10'.toDoubleAmount(), equals(100.10));
  });

  test('GBP 100,000,000.10 TO double', () {
    expect('GBP 1000,000,000.10'.toDoubleAmount(), equals(1000000000.1));
  });

  test('GBP 1000,000,000.1 to double', () {
    expect('GBP 1000,000,000.1'.toDoubleAmount(), equals(1000000000.1));
  });

  test('99.99 AUD to double', () {
    expect('99.99 AUD'.toDoubleAmount(), equals(99.99));
  });

  test('0.99 AUD to double', () {
    expect('0.99 AUD'.toDoubleAmount(), equals(0.99));
  });

  test('1000,000,000.10 AUD to double', () {
    expect('1000,000,000.10'.toDoubleAmount(), equals(1000000000.10));
  });
}

void testStringAmountToString() {
  test('EUR 100.10', () {
    expect('EUR 100.10'.toStringAmount(), equals('100.10'));
  });

  test('GBP 1000,000,000.10', () {
    expect('GBP 1000,000,000.10'.toStringAmount(), equals('1000000000.10'));
  });

  test('1000,000,000.10 to string amount', () {
    expect('1000,000,000.10'.toStringAmount(), equals('1000000000.10'));
  });
}
