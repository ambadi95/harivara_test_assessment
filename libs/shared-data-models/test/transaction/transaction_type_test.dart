import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';

void main() {
  group('TransactionType.fromString()', () {
    testWidgets('should return debit', (tester) async {
      // Arrange
      const debitString = 'debit';
      // Act
      final result = TransactionType.fromString(debitString);
      // Assert
      expect(result, isA<Debit>());
    });
    testWidgets('should return credit', (tester) async {
      // Arrange
      const creditString = 'credit';
      // Act
      final res = TransactionType.fromString(creditString);
      // Assert
      expect(res, isA<Credit>());
    });
    testWidgets('should return N/A', (tester) async {
      // Arrange
      const creditString = 'N/A';
      // Act
      final res = TransactionType.fromString(creditString);
      // Assert
      expect(res, isA<TransactionTypeNA>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'refund';
      // Act
      try {
        TransactionType.fromString(rawString);
        throw Exception('not implemented');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });
  group('TransactionType.toString', () {
    test('Should return debit as a String', () async {
      // Arrange
      const input = TransactionType.debit();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'debit');
    });

    test('Should return credit as a String', () async {
      // Arrange
      const input = TransactionType.credit();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'credit');
    });

    test('Should return N/A', () async {
      // Arrange
      const input = TransactionType.notAvailable();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'N/A');
    });
  });
}
