import 'package:core/utils/input_formatters/numeric_text_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NumericTextFormatter numericTextFormatter;
  final oldTextEditingValue = TextEditingValue(text: '');

  setUp(() {
    numericTextFormatter = NumericTextFormatter();
  });

  test('should format correctly and return 0', () async {
    // Arrange
    const stringValue = '';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '0');
  });

  test('should format correctly and return 0.', () async {
    // Arrange
    const stringValue = '0.';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '0.');
  });

  test('should format correctly and return 0.4', () async {
    // Arrange
    const stringValue = '0.4';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '0.4');
  });

  test('should format correctly and return 2.00', () async {
    // Arrange
    const stringValue = '2.00';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '2.00');
  });

  test('should format correctly and return 1', () async {
    // Arrange
    const stringValue = '1';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1');
  });

  test('should format correctly and return 1.7', () async {
    // Arrange
    const stringValue = '1.7';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1.7');
  });

  test('should format correctly and return 1.77', () async {
    // Arrange
    const stringValue = '1.77';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1.77');
  });

  test('should format correctly and return 10', () async {
    // Arrange
    const stringValue = '10';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '10');
  });

  test('should format correctly and return 100', () async {
    // Arrange
    const stringValue = '100';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '100');
  });

  test('should format correctly and return 1,222', () async {
    // Arrange
    const stringValue = '1222';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1,222');
  });

  test('should format correctly and return 1,222.98', () async {
    // Arrange
    const stringValue = '1222.98';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1,222.98');
  });

  test('should format correctly and return 25,000', () async {
    // Arrange
    const stringValue = '25000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '25,000');
  });

  test('should format correctly and return 250,000', () async {
    // Arrange
    const stringValue = '250000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '250,000');
  });

  test('should format correctly and return 1,000,000', () async {
    // Arrange
    const stringValue = '1000000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1,000,000');
  });

  test('should format correctly and return 10,000,000', () async {
    // Arrange
    const stringValue = '10000000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '10,000,000');
  });

  test('should format correctly and return 100,000,000', () async {
    // Arrange
    const stringValue = '100000000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '100,000,000');
  });

  test('should format correctly and return 1,000,000,000', () async {
    // Arrange
    const stringValue = '1000000000';
    // Act
    final result = numericTextFormatter.formatEditUpdate(
      oldTextEditingValue,
      TextEditingValue(text: stringValue),
    );
    // Assert
    expect(result.text, '1,000,000,000');
  });
}
