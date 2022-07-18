import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/payment/merchant_details.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return merchant details Object', () async {
      // Arrange
      final json = rawJsonToMap('payment/merchant_details.json');
      // Act
      final result = MerchantDetails.fromJson(json);
      // Assert
      expect(result, isA<MerchantDetails>());
      expect(result.name, json['name']);
      expect(result.type, json['type']);
      expect(result.logo, json['logo']);
      expect(result.address, json['address']);
      expect(result.contact, json['contact']);
      expect(result.merchantID, json['merchantID']);
    });
  });
}
