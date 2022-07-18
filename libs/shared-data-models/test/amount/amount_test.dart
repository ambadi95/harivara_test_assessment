import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/amount/amount.dart';
import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return Balance Object', () async {
      // Arrange
      final json = rawJsonToMap('account_balance.json');
      // Act
      final result = Amount.fromJson(json);
      // Assert
      expect(result.amount, json['amount']);
      expect(result.currency, json['currency']);
    });
  });
}
