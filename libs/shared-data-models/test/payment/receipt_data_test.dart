import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/receipt_data.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return Receipt Data Object', () async {
      // Arrange
      final json = rawJsonToMap('payment/receipt_data.json');
      // Act
      final result = ReceiptData.fromJson(json);
      // Assert
      expect(result, isA<ReceiptData>());
      expect(result.orderValue, json['orderValue']);
      expect(result.discountPercentage, json['discountPercentage']);
      expect(result.discountValue, json['discountValue']);
      expect(result.vatPercentage, json['vatPercentage']);
      expect(result.vatValue, json['vatValue']);
      expect(result.orderID, json['orderID']);
      expect(result.transferId, json['transferId']);
    });
  });
}
