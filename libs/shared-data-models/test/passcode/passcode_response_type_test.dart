import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/passcode/passcode_response_type.dart';

void main() {
  group('[PasscodeResponseType] - fromString() validation -', () {
    test('should return PasscodeResponseSuccess', () async {
      // Arrange
      const rawString = 'Success';
      // Act
      final result = PasscodeResponseType.fromString(rawString);
      // Assert
      expect(result, isA<PasscodeResponseSuccess>());
    });

    test('should return PasscodeResponseFailure', () async {
      // Arrange
      const rawString = 'Failure';
      // Act
      final result = PasscodeResponseType.fromString(rawString);
      // Assert
      expect(result, isA<PasscodeResponseFailure>());
    });
  });

  group('[PasscodeResponseType] - toString() validation -', () {
    test('should return Success', () async {
      // Arrange
      const responseMessage = PasscodeResponseType.success();
      // Act
      final result = responseMessage.toString();
      // Assert
      expect(result, 'Success');
    });

    test('should return Failure', () async {
      // Arrange
      const responseMessage = PasscodeResponseType.failure();
      // Act
      final result = responseMessage.toString();
      // Assert
      expect(result, 'Failure');
    });
  });
}
