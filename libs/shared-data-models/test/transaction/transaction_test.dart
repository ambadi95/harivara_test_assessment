import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/base_transactions/purchase_base_transaction.dart';
import 'package:shared_data_models/transaction/transaction_models/added_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/not_available.dart';
import 'package:shared_data_models/transaction/transaction_models/p2m.dart';
import 'package:shared_data_models/transaction/transaction_models/purchase.dart';
import 'package:shared_data_models/transaction/transaction_models/received_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/refund.dart';
import 'package:shared_data_models/transaction/transaction_models/sent_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/subscription.dart';
import '../raw_json_files/raw_json_reader.dart';
import 'package:shared_data_models/transaction/transaction.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUp(() {
    initializeDateFormatting('en');
  });

  group('[Transaction] - fromJson() -', () {
    test('should return valid purchase transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/purchase_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<Purchase>());
    });

    test('should return valid subscription transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/subscription_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<Subscription>());
    });

    test('should return valid refund transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/refund_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<Refund>());
    });

    test('should return valid added_funds transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/added_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<AddedFunds>());
    });

    test('should return valid sent_funds transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/sent_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<SentFunds>());
    });

    test('should return valid received_funds transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/received_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<ReceivedFunds>());
    });

    test('should return valid p2m transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/p2m_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<P2MTransaction>());
    });

    test('should return valid not available transaction', () async {
      // Arrange
      final json = rawJsonToMap('transactions/not_available_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      expect(result, isA<NotAvailableTransaction>());
    });
  });

  group('[Transaction] - purchase transaction handling', () {
    test('should have refund transactions available to access when present',
        () async {
      // Arrange
      final json = rawJsonToMap('transactions/purchase_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      if (result is Purchase) {
        expect(result.refundTransactions, isA<List<Refund>>());
        expect(
          result.refundTransactions![0].transId,
          json['originalTransaction'][0]['refundTransactionId'],
        );
        expect(
          result.refundTransactions![1].remarks,
          json['originalTransaction'][1]['remarks'],
        );
      } else {
        throw Exception('not purchase');
      }
    });
  });

  group('[Transaction] - refund transaction handling', () {
    test(
        'should have original purchase transaction available to access when present',
        () async {
      // Arrange
      final json = rawJsonToMap('transactions/refund_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      // Assert
      if (result is Refund) {
        expect(result.originalTransaction, isA<PurchaseBaseTransaction>());
        expect(result.originalTransaction!.refundTransactions, null);
        expect(
          result.originalTransaction!.merchantName,
          json['originalTransaction'][0]['merchantName'],
        );
      } else {
        throw Exception('not refund');
      }
    });
  });

  group('[Transaction] - toString() -', () {
    test('should return purchase', () async {
      // Arrange
      final json = rawJsonToMap('transactions/purchase_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'purchase');
    });

    test('should return refund', () async {
      // Arrange
      final json = rawJsonToMap('transactions/refund_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'refund');
    });

    test('should return added-funds', () async {
      // Arrange
      final json = rawJsonToMap('transactions/added_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'added-funds');
    });

    test('should return received-funds', () async {
      // Arrange
      final json = rawJsonToMap('transactions/received_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'received-funds');
    });

    test('should return sent-funds', () async {
      // Arrange
      final json = rawJsonToMap('transactions/sent_funds_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'sent-funds');
    });

    test('should return subscription', () async {
      // Arrange
      final json = rawJsonToMap('transactions/subscription_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'subscription');
    });

    test('should return Purchase', () async {
      // Arrange
      final json = rawJsonToMap('transactions/p2m_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'Purchase');
    });

    test('should return N/A', () async {
      // Arrange
      final json = rawJsonToMap('transactions/not_available_transaction.json');
      // Act
      final result = Transaction.fromJson(json);
      String category = result.toString();
      // Assert
      expect(category, 'N/A');
    });
  });
}
