import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/payment_context_type.dart';

void main() {
  group('[PaymentContextType] - fromString() validation -', () {
    test('should return M2M', () async {
      // Arrange
      const rawString = 'M2M';
      // Act
      final result = PaymentContextType.fromString(rawString);
      // Assert
      expect(result, isA<M2M>());
    });

    test('should return P2M', () async {
      // Arrange
      const rawString = 'P2M';
      // Act
      final result = PaymentContextType.fromString(rawString);
      // Assert
      expect(result, isA<P2M>());
    });

    test('should return P2P', () async {
      // Arrange
      const rawString = 'P2P';
      // Act
      final result = PaymentContextType.fromString(rawString);
      // Assert
      expect(result, isA<P2P>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'M2P';
      // Act
      try {
        PaymentContextType.fromString(rawString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[PaymentContextType] - toString() validation -', () {
    test('should return M2M', () async {
      // Arrange
      const PaymentContextType paymentContextType = PaymentContextType.m2m();
      // Act
      final result = paymentContextType.toString();
      // Assert
      expect(result, 'M2M');
    });

    test('should return P2M', () async {
      // Arrange
      const PaymentContextType paymentContextType = PaymentContextType.p2m();
      // Act
      final result = paymentContextType.toString();
      // Assert
      expect(result, 'P2M');
    });

    test('should return P2P', () async {
      // Arrange
      const PaymentContextType paymentContextType = PaymentContextType.p2p();
      // Act
      final result = paymentContextType.toString();
      // Assert
      expect(result, 'P2P');
    });
  });
}
