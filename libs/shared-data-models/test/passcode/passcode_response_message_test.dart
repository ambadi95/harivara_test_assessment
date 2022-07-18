import 'package:flutter_test/flutter_test.dart';

import 'package:shared_data_models/passcode/passcode_response_message.dart';

void main() {
  group('[PasscodeResponseMessage] - fromString() validation -', () {
    test('should return PasscodeMessageLoginSuccess', () async {
      // Arrange
      const rawString = 'Login Success';
      // Act
      final result = PasscodeResponseMessage.fromString(rawString);
      // Assert
      expect(result, isA<PasscodeMessageLoginSuccess>());
    });

    test('should throw UnimplementedError', () async {
      // Arrange
      const rawString = 'Failure';
      // Act
      final result = PasscodeResponseMessage.fromString(rawString);
      // Assert
      expect(result, isA<PasscodeMessageLoginFailed>());
    });
  });

  group('[PasscodeResponseMessage] - toString() validation -', () {
    test('should return Login Success', () async {
      // Arrange
      const responseMessage = PasscodeResponseMessage.loginSuccess();
      // Act
      final result = responseMessage.toString();
      // Assert
      expect(result, 'Login Success');
    });

    test('should return Login Failed', () async {
      // Arrange
      const responseMessage = PasscodeResponseMessage.loginFailed();
      // Act
      final result = responseMessage.toString();
      // Assert
      expect(result, 'Login Failed');
    });
  });
}
