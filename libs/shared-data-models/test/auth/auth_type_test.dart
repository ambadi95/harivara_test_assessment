import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/auth/auth_type.dart';

void main() {
  group('[AuthType] - fromString() validation -', () {
    test('should return FaceId', () async {
      // Arrange
      const rawString = 'FACEID';
      // Act
      final result = AuthType.fromString(rawString);
      // Assert
      expect(result, isA<FaceId>());
    });

    test('should return FingerPrint', () async {
      // Arrange
      const rawString = 'FINGERPRINT';
      // Act
      final result = AuthType.fromString(rawString);
      // Assert
      expect(result, isA<FingerPrint>());
    });

    test('should return MPIN', () async {
      // Arrange
      const rawString = 'MPIN';
      // Act
      final result = AuthType.fromString(rawString);
      // Assert
      expect(result, isA<MPIN>());
    });

    test('should return PIN', () async {
      // Arrange
      const rawString = 'PIN';
      // Act
      final result = AuthType.fromString(rawString);
      // Assert
      expect(result, isA<PIN>());
    });

    test('should return TPIN', () async {
      // Arrange
      const rawString = 'TPIN';
      // Act
      final result = AuthType.fromString(rawString);
      // Assert
      expect(result, isA<TPIN>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'PHONENUMBER';
      // Act
      try {
        AuthType.fromString(rawString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[AuthType] - toString() validation -', () {
    test('should return FACEID', () async {
      // Arrange
      const AuthType authType = AuthType.faceId();
      // Act
      final result = authType.toString();
      // Assert
      expect(result, 'FACEID');
    });

    test('should return FINGERPRINT', () async {
      // Arrange
      const AuthType authType = AuthType.fingerPrint();
      // Act
      final result = authType.toString();
      // Assert
      expect(result, 'FINGERPRINT');
    });

    test('should return MPIN', () async {
      // Arrange
      const AuthType authType = AuthType.mpin();
      // Act
      final result = authType.toString();
      // Assert
      expect(result, 'MPIN');
    });

    test('should return PIN', () async {
      // Arrange
      const AuthType authType = AuthType.pin();
      // Act
      final result = authType.toString();
      // Assert
      expect(result, 'PIN');
    });

    test('should return TPIN', () async {
      // Arrange
      const AuthType authType = AuthType.tpin();
      // Act
      final result = authType.toString();
      // Assert
      expect(result, 'TPIN');
    });
  });
}
