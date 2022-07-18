import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/transaction_status.dart';

void main() {
  group('TransactionStatus.fromString()', () {
    testWidgets('should return success', (tester) async {
      // Arrange
      const successString = 'success';
      // Act
      final res1 = TransactionStatus.fromString(successString);
      // Assert
      expect(res1, isA<Success>());
    });

    testWidgets('should return pending', (tester) async {
      // Arrange
      const pendingString = 'pending';
      // Act
      final res2 = TransactionStatus.fromString(pendingString);
      // Assert
      expect(res2, isA<Pending>());
    });

    testWidgets('should return failed', (tester) async {
      // Arrange
      const failedString = 'failed';
      // Act
      final res3 = TransactionStatus.fromString(failedString);
      // Assert
      expect(res3, isA<Failed>());
    });

    testWidgets('should return queued', (tester) async {
      // Arrange
      const queuedString = 'queued';
      // Act
      final res4 = TransactionStatus.fromString(queuedString);
      // Assert
      expect(res4, isA<Queued>());
    });

    testWidgets('should return cancelled', (tester) async {
      // Arrange
      const cancelString = 'cancelled';
      // Act
      final res5 = TransactionStatus.fromString(cancelString);
      // Assert
      expect(res5, isA<Cancelled>());
    });

    testWidgets('should return N/A', (tester) async {
      // Arrange
      const string = 'N/A';
      // Act
      final res5 = TransactionStatus.fromString(string);
      // Assert
      expect(res5, isA<TransactionStatusNA>());
    });

    testWidgets('should throw exception', (tester) async {
      // Arrange
      const statusErrorString = 'unimplementedTransactionError';
      // Act
      try {
        TransactionStatus.fromString(statusErrorString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
      // Assert
    });
  });

  group('TransactionStatus.toString', () {
    test('Should return cancelled as a String', () async {
      // Arrange
      const input = TransactionStatus.cancelled();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'transaction-status-cancelled');
    });

    test('Should return failed as a String', () async {
      // Arrange
      const input = TransactionStatus.failed();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'transaction-status-failed');
    });

    test('Should return pending as a String', () async {
      // Arrange
      const input = TransactionStatus.pending();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'transaction-status-pending');
    });

    test('Should return queued as a String', () async {
      // Arrange
      const input = TransactionStatus.queued();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'transaction-status-queued');
    });

    test('Should return N/A', () async {
      // Arrange
      const input = TransactionStatus.notAvailable();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'N/A');
    });

    test('Should return success as a String', () async {
      // Arrange
      const input = TransactionStatus.success();
      // Act
      final result = input.toString();
      // Assert
      expect(result, 'transaction-status-success');
    });
  });
}
