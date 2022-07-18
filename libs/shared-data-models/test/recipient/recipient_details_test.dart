import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/account/account_scheme_type.dart';
import 'package:shared_data_models/recipient/receipient_details.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  setUp(() {});

  group('[RecipientDetails] - fromJson()', () {
    test('should return a valid model', () async {
      // Arrange
      final json = rawJsonToMap('recipient/recipient_details.json');
      // Act
      final result = RecipientDetails.fromJson(json);
      // Assert
      expect(result, isA<RecipientDetails>());
      expect(result.mobileNumber, json['mobileNumber']);
      expect(result.accountSchemeType, isA<AccountSchemeType>());
      expect(result.accountSchemeType.toString(), json['schemeType']);
      expect(result.schemeValue, json['schemeValue']);
    });
  });
}
