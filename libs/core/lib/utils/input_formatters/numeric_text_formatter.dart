import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumericTextFormatter extends TextInputFormatter {
  static TextEditingValue formatValue(
    String amountText, {
    NumberFormat? numberFormat,
  }) {
    final parsedAmount;

    if (amountText == '.') {
      parsedAmount = 0.0;
    } else {
      parsedAmount = double.parse(amountText.replaceAll(',', ''));
    }
    final formatter = numberFormat ?? NumberFormat('###,###.##');
    var formattedText = formatter.format(parsedAmount);

    if (amountText.endsWith('.00')) {
      formattedText += '.00';
    } else {
      formattedText += amountText.endsWith('.0') ? '.0' : '';
    }
    formattedText += amountText.endsWith('.') ? '.' : '';

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formattedText.length),
      ),
    );
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final parsedNumber = double.tryParse(newValue.text.replaceAll(',', ''));

    if (newValue.text.isNotEmpty && parsedNumber != null) {
      return formatValue(newValue.text);
    } else {
      return newValue.copyWith(
        text: '0',
        selection: TextSelection.fromPosition(TextPosition(offset: 1)),
      );
    }
  }
}
