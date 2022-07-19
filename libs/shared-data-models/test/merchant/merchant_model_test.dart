import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/agent/merchant_model.dart';
import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return agent model Object', () async {
      // Arrange
      final json = rawJsonToMap('agent/merchant_model.json');
      // Act
      final result = MerchantModel.fromJson(json);
      // Assert
      expect(result, isA<MerchantModel>());
      expect(result.merchantId, json['merchantId']);
      expect(result.mobileNo, json['mobileNo']);
      expect(result.email, json['email']);
      expect(result.companyName, json['companyName']);
      expect(result.registrationNo, json['registrationNo']);
    });
  });
}
