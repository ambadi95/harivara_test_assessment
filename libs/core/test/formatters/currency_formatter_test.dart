import 'package:core/formatters/currency_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_data_models/amount/amount.dart';

class MockAmount extends Mock implements Amount {}

void main() {
  late CurrencyFormatter formatter;
  setUp(() {
    formatter = CurrencyFormatter();
  });

  group('formatWithDouble', () {
    test('should add trailing zero', () async {
      // Arrange
      final value = 1204.1;
      // Act
      final result = formatter.formatWithDouble(value);
      // Assert
      expect(result, '1,204.10');
    });

    test('should have 2 trailing zeroes', () async {
      // Arrange
      final value = 1204.0;
      // Act
      final result = formatter.formatWithDouble(value);
      // Assert
      expect(result, '1,204.00');
    });

    test('should have no comma', () async {
      // Arrange
      final value = 900.0;
      // Act
      final result = formatter.formatWithDouble(value);
      // Assert
      expect(result, '900.00');
    });

    test('should have no comma', () async {
      // Arrange
      final value = 250000.0;
      // Act
      final result = formatter.formatWithDouble(value);
      // Assert
      expect(result, '250,000.00');
    });

    test('should include SAR currency if passed', () async {
      // Arrange
      final value = 250000.0;
      // Act
      final result = formatter.formatWithDouble(value, currency: 'SAR');
      // Assert
      expect(result, 'SAR 250,000.00');
    });

    test('should include USD currency if passed', () async {
      // Arrange
      final value = 250000.0;
      // Act
      final result = formatter.formatWithDouble(value, currency: 'USD');
      // Assert
      expect(result, 'USD 250,000.00');
    });
  });

  group('format with String', () {

    test('should have 2 trailing zeroes', () async {
      // Arrange
      final value = '1204';
      // Act
      final result = formatter.formatWithString(value);
      // Assert
      expect(result, '1,204.00');
    });

    test('should include SAR currency if passed', () async {
      // Arrange
      final value = '250000.00';
      // Act
      final result = formatter.formatWithString(value, currency: 'SAR');
      // Assert
      expect(result, 'SAR 250,000.00');
    });

    test('should include USD currency if passed', () async {
      // Arrange
      final value = '250000.00';
      // Act
      final result = formatter.formatWithString(value, currency: 'USD');
      // Assert
      expect(result, 'USD 250,000.00');
    });
  });

  group('format with Amount', () {
    late Amount amount;

    setUp(() {
      amount = MockAmount();
    });

    test('should have 2 trailing zeroes', () async {
      // Arrange
      when(() => amount.amount).thenReturn(1204.0);
      // Act
      final result = formatter.formatWithAmount(amount);
      // Assert
      expect(result, '1,204.00');
    });

    test('should include SAR currency if passed', () async {
      // Arrange
      when(() => amount.amount).thenReturn(250000.0);
      when(() => amount.currency).thenReturn('SAR');
      // Act
      final result = formatter.formatWithAmount(amount, showCurrency: true);
      // Assert
      expect(result, 'SAR 250,000.00');
    });

    test('should include SAR currency if passed', () async {
      // Arrange
      when(() => amount.amount).thenReturn(250000.0);
      when(() => amount.currency).thenReturn('USD');
      // Act
      final result = formatter.formatWithAmount(amount, showCurrency: true);
      // Assert
      expect(result, 'USD 250,000.00');
    });
  });
}
