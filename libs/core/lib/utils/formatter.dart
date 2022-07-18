import 'package:intl/intl.dart';

class Formatter {
  String formatThousands(double number, {String? locale, String? symbol}) =>
      Formatter.currency(number, locale: locale, symbol: symbol, decimalDigits: 0);

  String decimalPattern({String? locale, required double value}) {
    return NumberFormat.decimalPattern(locale).format(value);
  }

  // Parses a string and returns a double or throws [FormatException]
  static double parse(String numberString) => NumberFormat().parse(numberString).toDouble();

  /// Get a formatted currency string based on the current locale.
  /// Pass an empty [symbol] string to avoid prefixing the currency with the ISO-4217 currency name.
  /// Pass a ISO-4217 currency [name] string to determine the correct number of decimal digits for that currency, or
  /// override with the [decimalDigits] value
  static String currency(double number, {String? locale, String? symbol, String? name, int? decimalDigits}) {
    final formatter = NumberFormat.currency(decimalDigits: decimalDigits, symbol: symbol, name: name);
    return formatter.format(number);
  }

  // Formats a currency with a trailing name
  static String currencyWithTrailingName(
    double number, {
    String? locale,
    String? symbol,
    required String name,
    int? decimalDigits,
  }) =>
      Formatter.currency(number, locale: locale, symbol: symbol, name: name, decimalDigits: decimalDigits) + ' $name';
}
