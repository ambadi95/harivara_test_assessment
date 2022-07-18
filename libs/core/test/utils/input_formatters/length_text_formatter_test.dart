import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  late LengthTextFormatter lengthTextFormatter;
  final numberOfDigitsPermitted = 6;
  final formatter = NumberFormat('###,###.##');

  setUp(() {
    lengthTextFormatter = LengthTextFormatterImpl(
      numberOfDigitsPermitted: numberOfDigitsPermitted,
      upperLimit: 20000.0,
    );
  });

  group('[LengthTextFormatter] - formatEditUpdate() -', () {
    test('should return 0 when newAmount is empty', () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '');
      const TextEditingValue newAmount = TextEditingValue(text: '');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      // Assert
      expect(result.text, '0');
    });

    test('should return newAmount if the limit does not exceed', () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '20');
      const TextEditingValue newAmount = TextEditingValue(text: '200');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      // Assert
      expect(result.text, '200');
    });

    test('should return oldAmount if the limit exceeds', () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '21,000');
      const TextEditingValue newAmount = TextEditingValue(text: '21,0000');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      final numberResult = double.parse(result.text.replaceAll(',', ''));
      // Assert
      expect(formatter.format(numberResult), '21,000');
    });

    test(
        'should return newAmount if limit exceeds and old amount is below limit',
        () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '14,000');
      const TextEditingValue newAmount = TextEditingValue(text: '140,000');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      final numberResult = double.parse(result.text.replaceAll(',', ''));
      // Assert
      expect(formatter.format(numberResult), '140,000');
    });

    test('should return newAmount with two digits', () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '14.0');
      const TextEditingValue newAmount = TextEditingValue(text: '14.01');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      final numberResult = double.parse(result.text.replaceAll(',', ''));
      // Assert
      expect(formatter.format(numberResult), '14.01');
    });

    test('newAmount should not exceed two digits', () async {
      // Arrange
      const TextEditingValue oldAmount = TextEditingValue(text: '14.01');
      const TextEditingValue newAmount = TextEditingValue(text: '14.012');
      // Act
      final result = lengthTextFormatter.formatEditUpdate(oldAmount, newAmount);
      final numberResult = double.parse(result.text.replaceAll(',', ''));
      // Assert
      expect(formatter.format(numberResult), '14.01');
    });
  });
}
