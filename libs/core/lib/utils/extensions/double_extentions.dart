import 'package:intl/intl.dart';

extension DoubleExtensions on double? {
  /// Converts strings containing amount to double.
  /// Examples:
  /// - “GBP 100.10” = 100.10
  /// - “GBP 1000,000,000.10” =  100000000.10
  /// - “1000,000,000.10” = 100000000.10
  /// - “99.99 USD” = 99.99
  String? toAmount({String? symbol, bool putSymbolFirst = true}) {
    if (this == null) return null;

    return NumberFormat.currency(
      symbol: symbol ?? '',
      customPattern: putSymbolFirst ? '\u00A4 #,##0.00' : '#,##0.00 \u00A4 ',
    ).format(this!).trim();
  }
}
