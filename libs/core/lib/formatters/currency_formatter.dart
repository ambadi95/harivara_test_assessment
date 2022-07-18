import 'package:intl/intl.dart';
import 'package:shared_data_models/amount/amount.dart';

class CurrencyFormatter {
  NumberFormat _formatter(String? currency) => NumberFormat.currency(
        decimalDigits: 2,
        name: currency != null ? '$currency ' : '',
      );

  String formatWithDouble(double value, {String? currency}) =>
      _formatter(currency).format(value);

  String formatWithString(String value, {String? currency}) =>
      _formatter(currency).format(double.parse(value));

  String formatWithAmount(Amount amount, {bool showCurrency = false}) =>
      _formatter(showCurrency ? amount.currency : null).format(amount.amount);
}
