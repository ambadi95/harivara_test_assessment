import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const _decimalSeparator = '.';
final _decimalCountMatcher = RegExp(r'\.\d{3}$');

/// Formats input value to
/// 1
/// 1,234
/// 1,234,567.10
/// 1,234,567.12
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var allChars =
        newValue.text.characters.where((it) => (it == _decimalSeparator));
    if (allChars.length > 1) {
      // Cannot input more then one decimal separator
      return oldValue;
    }

    if (newValue.text[newValue.text.length - 1] == _decimalSeparator &&
        oldValue.text[oldValue.text.length - 1] != _decimalSeparator) {
      // New decimal separator inputted, no format required
      return newValue;
    }

    if (_decimalCountMatcher.hasMatch(newValue.text)) {
      // Only two decimals are allowed
      return oldValue;
    }

    final formatCurrency = NumberFormat.currency(
      symbol: '',
      name: '',
      decimalDigits: _calculateDecimalDigits(newValue.text),
    );

    try {
      final value = formatCurrency.parse(newValue.text).toDouble();
      final formattedText = formatCurrency.format(value);

      // New text
      if (!newValue.text.contains(_decimalSeparator)) {
        return newValue.copyWith(
          text: formattedText.replaceAll('\.+', ''),
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      } else {
        return newValue.copyWith(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
    } catch (e) {
      // Couldn't parse this as a decimal number
      return oldValue;
    }
  }

  int _calculateDecimalDigits(String amount) {
    final dotIndex = amount.indexOf(_decimalSeparator);

    if (dotIndex == -1) {
      return 0;
    } else {
      var substring = amount.substring(
        amount.lastIndexOf(_decimalSeparator),
        amount.length,
      );
      return min(2, substring.length - 1);
    }
  }
}
