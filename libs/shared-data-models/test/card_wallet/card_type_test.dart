import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_type.dart';

void main() {
  group('[CardType] - fromString()', () {
    test('should return credit', () async {
      // Arrange
      const rawString = 'Credit';
      // Act
      final result = CardType.fromString(rawString);
      // Assert
      expect(result, isA<CreditCard>());
    });

    test('should return Debit', () async {
      // Arrange
      const rawString = 'Debit';
      // Act
      final result = CardType.fromString(rawString);
      // Assert
      expect(result, isA<DebitCard>());
    });

    test('should thor exception', () async {
      // Arrange
      const rawString = 'unimplementedCardType';
      // Act
      try {
        CardType.fromString(rawString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[CardType] - toString()', () {
    test('should return credit', () async {
      // Arrange
      const cardType = CardType.credit();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'credit');
    });

    test('should return debit', () async {
      // Arrange
      const cardType = CardType.debit();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'debit');
    });
  });
}
