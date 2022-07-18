import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/transaction_category.dart';

void main() {
  group('TransactionCategory.fromString()', () {
    testWidgets('should return purchase', (tester) async {
      // Arrange
      final String category = 'purchase';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<PurchaseCategory>());
    });

    testWidgets('should return refund', (tester) async {
      // Arrange
      final String category = 'refund';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<RefundCategory>());
    });

    testWidgets('should return addedFunds', (tester) async {
      // Arrange
      final String category = 'Added funds';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<AddedFundsCategory>());
    });
    testWidgets('should return receivedFunds', (tester) async {
      // Arrange
      final String category = 'Received funds';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<ReceivedFundsCategory>());
    });
    testWidgets('should return sentFunds', (tester) async {
      // Arrange
      final String category = 'Sent funds';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<SentFundsCategory>());
    });
    testWidgets('should return subscription', (tester) async {
      // Arrange
      final String category = 'Subscription';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<SubscriptionCategory>());
    });

    testWidgets('should return NotAvailable', (tester) async {
      // Arrange
      final String category = 'N/A';
      // Act
      final transactionCategory = TransactionCategory.fromString(category);
      // Assert
      expect(transactionCategory, isA<NotAvailable>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'PAYCASH';
      // Act
      try {
        TransactionCategory.fromString(rawString);
        throw Exception('not implemented');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });
}
