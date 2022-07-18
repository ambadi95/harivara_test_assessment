import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/passcode/passcode_attempt_type.dart';

void main() {
  group('[PasscodeAttemptType] - changeAttempt() -', () {
    test('should return FirstAttempt', () async {
      // Arrange
      const PasscodeAttemptType attemptType =
          PasscodeAttemptType.initialAttempt();
      // Act
      final result = PasscodeAttemptType.changeAttempt(attemptType);
      // Assert
      expect(result, isA<FirstAttempt>());
    });

    test('should return SecondAttempt', () async {
      // Arrange
      const PasscodeAttemptType attemptType =
          PasscodeAttemptType.firstAttempt();
      // Act
      final result = PasscodeAttemptType.changeAttempt(attemptType);
      // Assert
      expect(result, isA<SecondAttempt>());
    });

    test('should return ThirdAttempt when is SecondAttempt', () async {
      // Arrange
      const PasscodeAttemptType attemptType =
          PasscodeAttemptType.secondAttempt();
      // Act
      final result = PasscodeAttemptType.changeAttempt(attemptType);
      // Assert
      expect(result, isA<ThirdAttempt>());
    });

    test('should return ThirdAttempt when is ThirdAttempt', () async {
      // Arrange
      const PasscodeAttemptType attemptType =
          PasscodeAttemptType.thirdAttempt();
      // Act
      final result = PasscodeAttemptType.changeAttempt(attemptType);
      // Assert
      expect(result, isA<ThirdAttempt>());
    });
  });
}
