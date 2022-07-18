import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/login_model/login_request.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  final json = rawJsonToMap('login_request/login_request.json');
  test('[LoginRequest] - fromJson()', () async {
    // Act
    final result = LoginRequest.fromJson(json);
    // Assert
    expect(result, isA<LoginRequest>());
    expect(result.customerId, json['customerId']);
    expect(result.passcode, json['passcode']);
  });

  test('[LoginRequest] - toJson()', () async {
    // Arrange
    final LoginRequest loginRequest = LoginRequest(
      json['customerId'],
      json['passcode'],
    );
    // Act
    final result = loginRequest.toJson(loginRequest);
    // Assert
    expect(result['customerId'], json['customerId']);
    expect(result['passcode'], json['passcode']);
  });
}
