import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/payment_response.dart';
import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return payment response Object', () async {
      // Arrange
      final json = rawJsonToMap('payment/payment_response.json');
      // Act
      final result = PaymentResponse.fromJson(json);
      // Assert
      expect(result, isA<PaymentResponse>());
      // expect(result.transactionId, json['transactionId']);
      // expect(result.merchantDetails, isA<MerchantDetails>());
      // expect(result.receiptData, isA<ReceiptData>());
      // expect(result.paymentMethod, json['paymentMethod']);
      // expect(result.paymentDateTime, json['paymentDateTime']);
      // expect(result.codeType, json['codeType']);
    });
  });
}
