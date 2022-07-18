import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/account/account_scheme_type.dart';

void main() {
  group('[AccountSchemeType] - fromString() validation -', () {
    test('should return WALLET', () async {
      // Arrange
      const rawString = 'WALLET';
      // Act
      final result = AccountSchemeType.fromString(rawString);
      // Assert
      expect(result, isA<WALLET>());
    });

    test('should return IBAN', () async {
      // Arrange
      const rawString = 'IBAN';
      // Act
      final result = AccountSchemeType.fromString(rawString);
      // Assert
      expect(result, isA<IBAN>());
    });

    test('should throw exception', () async {
      // Arrange
      const rawString = 'ACCOUNT';
      // Act
      try {
        AccountSchemeType.fromString(rawString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
    });
  });

  group('[AccountSchemeType] - toString() validation -', () {
    test('should return WALLET', () async {
      // Arrange
      const AccountSchemeType accountSchemeType = AccountSchemeType.wallet();
      // Act
      final result = accountSchemeType.toString();
      // Assert
      expect(result, 'WALLET');
    });

    test('should return IBAN', () async {
      // Arrange
      const AccountSchemeType accountSchemeType = AccountSchemeType.iban();
      // Act
      final result = accountSchemeType.toString();
      // Assert
      expect(result, 'IBAN');
    });
  });
}
