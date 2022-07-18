import 'package:core/validators/input_entry_validator/input_entry_validator.dart';
import 'package:core/validators/input_entry_validator/input_entry_validator_values.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInputEntryValidatorValues extends Mock
    implements InputEntryValidatorValues {}

void main() {
  late InputEntryValidator inputEntryValidator;
  late InputEntryValidatorValues validatorValues;
  final upperLimit = 20000.0;
  final maxNumOfDigits = 5;

  setUp(() {
    validatorValues = MockInputEntryValidatorValues();
    when(() => validatorValues.upperLimit).thenReturn(upperLimit);
    when(() => validatorValues.lowerLimit).thenReturn(1.0);
    when(() => validatorValues.numberOfDigitsPermitted)
        .thenReturn(maxNumOfDigits);
    inputEntryValidator = InputEntryValidatorImpl(validatorValues);
  });

  group('validateAmount', () {
    test('should return null if amount is correct', () async {
      // Arrange
      const amount = '1.00';
      // Act
      final result = inputEntryValidator.validateAmount(amount, 10000);
      // Assert
      expect(result, null);
    });

    test('should return null if amount == limit', () async {
      // Arrange
      const amount = '20000.00';
      const limit = 20000.00;
      // Act
      final result = inputEntryValidator.validateAmount(amount, limit);
      // Assert
      expect(result, null);
    });

    test('should return error message if amount is < 1', () async {
      // Arrange
      const amount = '0.1';
      // Act
      final result = inputEntryValidator.validateAmount(amount, 10000);
      // Assert
      expect(result, isA<String>());
    });

    test('should return monthly-limit-error if amount is >20000', () async {
      // Arrange
      const amount = '30000.00';
      // Act
      final result = inputEntryValidator.validateAmount(amount, 10000);
      // Assert
      expect(result, 'monthly-limit-error');
    });

    test('should return monthly-limit-error if amount is > limit', () async {
      // Arrange
      const amount = '12000.00';
      // Act
      final result = inputEntryValidator.validateAmount(amount, 10000);
      // Assert
      expect(result, 'monthly-limit-error');
    });

    test('should return null if amount is decimal place at end',
        () async {
      // Arrange
      const amount = '100.';
      // Act
      final result = inputEntryValidator.validateAmount(amount, 10000);
      // Assert
      expect(result, null);
    });
  });

  group('validateInputChangeFlag', () {
    test('should return true if amount length is 1 ', () async {
      // Arrange
      const amount = '1';
      // Act
      final result = inputEntryValidator.shouldUpdateUiWithNewValue(amount);
      // Assert
      expect(result, true);
    });

    test('should return true if amount length is <5', () async {
      // Arrange
      const amount = '1000';
      // Act
      final result = inputEntryValidator.shouldUpdateUiWithNewValue(amount);
      // Assert
      expect(result, true);
    });

    test('should return false if amount length is >5', () async {
      // Arrange
      const amount = '1000000';
      // Act
      final result = inputEntryValidator.shouldUpdateUiWithNewValue(amount);
      // Assert
      expect(result, false);
    });

    test('should return true if amount length is <2 after decimal', () async {
      // Arrange
      const amount = '100.12';
      // Act
      final result = inputEntryValidator.shouldUpdateUiWithNewValue(amount);
      // Assert
      expect(result, true);
    });

    test('should return false if amount length is > 2 after decimal', () async {
      // Arrange
      const amount = '100.123';
      // Act
      final result = inputEntryValidator.shouldUpdateUiWithNewValue(amount);
      // Assert
      expect(result, false);
    });
  });
}
