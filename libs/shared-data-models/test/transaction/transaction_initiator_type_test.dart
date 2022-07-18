import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/transaction_initiator_type.dart';

void main() {
  group('[TransactionInitiatorType] - fromString() validation -', () {
    test('should return Receiver', () async {
      // Arrange
      final String initiator = 'Receiver';
      // Act
      final transactionCategory =
          TransactionInitiatorType.fromString(initiator);
      // Assert
      expect(transactionCategory, isA<Receiver>());
    });

    test('should return Sender', () async {
      // Arrange
      final String initiator = 'Sender';
      // Act
      final transactionCategory =
          TransactionInitiatorType.fromString(initiator);
      // Assert
      expect(transactionCategory, isA<Sender>());
    });

    test('should return TransactionInitiatorNA', () async {
      // Arrange
      final String initiator = 'N/A';
      // Act
      final transactionCategory =
          TransactionInitiatorType.fromString(initiator);
      // Assert
      expect(transactionCategory, isA<TransactionInitiatorNA>());
    });

    test('should throw exception', () async {
      // Arrange
      final String initiator = 'SendReceive';
      // Act
      try {
        TransactionInitiatorType.fromString(initiator);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[TransactionInitiatorType] - toString() validation -', () {
    test('should return RECEIVER', () async {
      // Arrange
      final TransactionInitiatorType initiator =
          TransactionInitiatorType.receiver();
      // Act
      final result = initiator.toString();
      // Assert
      expect(result, 'RECEIVER');
    });

    test('should return SENDER', () async {
      // Arrange
      final TransactionInitiatorType initiator =
          TransactionInitiatorType.sender();
      // Act
      final result = initiator.toString();
      // Assert
      expect(result, 'SENDER');
    });

    test('should return N/A', () async {
      // Arrange
      final TransactionInitiatorType initiator =
          TransactionInitiatorType.notAvailable();
      // Act
      final result = initiator.toString();
      // Assert
      expect(result, 'N/A');
    });
  });
}
