import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/merchant_details.dart';
import 'package:shared_data_models/payment/receipt_data.dart';
import 'package:shared_data_models/payment/view_receipt_model.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return View Receipt Model Object', () async {
      // Arrange
      final json = rawJsonToMap('payment/view_receipt_model.json');
      // Act
      final result = ViewReceiptModel.fromJson(json);
      // Assert
      expect(result, isA<ViewReceiptModel>());
      expect(result.merchantDetails, isA<MerchantDetails>());
      expect(result.receiptData, isA<ReceiptData>());
      expect(result.paymentMethod, json['paymentMethod']);
      expect(result.paymentDateTime, json['paymentDateTime']);
      expect(result.codeType, json['codeType']);
    });
  });
}
