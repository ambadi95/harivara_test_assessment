import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/add_funds/add_funds_response.dart';
import 'package:shared_data_models/payment/payment_status.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  setUp(() {});

  group('[AddFundsResponse] - fromJson()', () {
    test('should return a valid model', () async {
      // Arrange
      final json = rawJsonToMap('add_funds/add_funds_response.json');
      // Act
      final result = AddFundsResponse.fromJson(json);
      // Assert
      expect(result, isA<AddFundsResponse>());
      expect(result.chargeId, json['paymentId']);
      expect(result.paymentStatus.toString(), json['paymentStatus']);
      expect(result.payment3dSecureUrl, json['payment3dSecureUrl']);
    });

    test('should return a valid model when paymentStatus is null', () async {
      // Arrange
      final json = rawJsonToMap('add_funds/add_funds_response_null.json');
      // Act
      final result = AddFundsResponse.fromJson(json);
      // Assert
      expect(result, isA<AddFundsResponse>());
      expect(result.chargeId, json['paymentId']);
      expect(result.paymentStatus, isA<VoidPayment>());
      expect(result.payment3dSecureUrl, json['payment3dSecureUrl']);
    });
  });
}
