import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/passcode/verify_passcode_response.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  final json = rawJsonToMap('passcode/verify_passcode_response.json');
  test('[VerifyPasscodeResponse] - fromJson()', () async {
    // Act
    final result = VerifyPasscodeResponse.fromJson(json);
    // Assert
    expect(result, isA<VerifyPasscodeResponse>());
    expect(result.statusCode, json['statusCode']);
    expect(result.status.toString(), json['status']);
    expect(result.message.toString(), json['message']);
  });

  test('[VerifyPasscodeResponse] - checkResponse()', () async {
    // Arrange
    final VerifyPasscodeResponse response =
        VerifyPasscodeResponse.fromJson(json);
    // Act
    final bool result = response.checkResponse();
    // Assert
    expect(result, true);
  });
}
