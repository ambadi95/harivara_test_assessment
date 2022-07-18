import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/payment_status.dart';

void main() {
  group('[PaymentStatus] - fromString() -', () {
    test('should return Abandoned', () async {
      // Arrange
      const rawString = 'Abandoned';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Abandoned>());
    });

    test('should return Authorized', () async {
      // Arrange
      const rawString = 'Authorized';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Authorized>());
    });

    test('should return Cancelled', () async {
      // Arrange
      const rawString = 'Cancelled';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Cancelled>());
    });

    test('should return Card Verified', () async {
      // Arrange
      const rawString = 'CardVerified';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Verified>());
    });

    test('should return Declined', () async {
      // Arrange
      const rawString = 'Declined';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Declined>());
    });

    test('should return Failed', () async {
      // Arrange
      const rawString = 'Failed';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Failed>());
    });

    test('should return Paid', () async {
      // Arrange
      const rawString = 'Paid';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Paid>());
    });

    test('should return Pending', () async {
      // Arrange
      const rawString = 'Pending';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Pending>());
    });

    test('should return Restricted', () async {
      // Arrange
      const rawString = 'Restricted';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<Restricted>());
    });

    test('should return PaymentTimeout', () async {
      // Arrange
      const rawString = 'Timeout';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<PaymentTimeout>());
    });

    test('should return PaymentUnknown', () async {
      // Arrange
      const rawString = 'Unknown';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<PaymentUnknown>());
    });

    test('should return VoidPayment', () async {
      // Arrange
      const rawString = 'Void';
      // Act
      final result = PaymentStatus.fromString(rawString);
      // Assert
      expect(result, isA<VoidPayment>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'Aborted';
      // Act
      try {
        PaymentStatus.fromString(rawString);
        throw Exception('test failed');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[PaymentStatus] - toString() -', () {
    test('should return Abandoned', () async {
      // Arrange
      const paymentStatus = PaymentStatus.abandoned();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Abandoned');
    });

    test('should return Authorized', () async {
      // Arrange
      const paymentStatus = PaymentStatus.authorized();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Authorized');
    });

    test('should return Cancelled', () async {
      // Arrange
      const paymentStatus = PaymentStatus.cancelled();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Cancelled');
    });

    test('should return CardVerified', () async {
      // Arrange
      const paymentStatus = PaymentStatus.verified();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'CardVerified');
    });

    test('should return Declined', () async {
      // Arrange
      const paymentStatus = PaymentStatus.declined();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Declined');
    });

    test('should return Failed', () async {
      // Arrange
      const paymentStatus = PaymentStatus.failed();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Failed');
    });

    test('should return Paid', () async {
      // Arrange
      const paymentStatus = PaymentStatus.paid();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Paid');
    });

    test('should return Pending', () async {
      // Arrange
      const paymentStatus = PaymentStatus.pending();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Pending');
    });

    test('should return Restricted', () async {
      // Arrange
      const paymentStatus = PaymentStatus.restricted();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Restricted');
    });

    test('should return Timeout', () async {
      // Arrange
      const paymentStatus = PaymentStatus.timeout();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Timeout');
    });

    test('should return Unknown', () async {
      // Arrange
      const paymentStatus = PaymentStatus.unknown();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Unknown');
    });

    test('should return Void', () async {
      // Arrange
      const paymentStatus = PaymentStatus.voidStatus();
      // Act
      final result = paymentStatus.toString();
      // Assert
      expect(result, 'Void');
    });
  });
}
