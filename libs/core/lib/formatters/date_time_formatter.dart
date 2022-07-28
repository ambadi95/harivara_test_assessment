import 'package:intl/intl.dart';

class DateTimeFormatter {
  String formatDashYMD(DateTime dateTime, {String? locale}) {
    final DateFormat _dateFormat = DateFormat('yyyy-MM-dd', locale);
    return _dateFormat.format(dateTime);
  }

  String formatBackslashDMY(DateTime dateTime, {String? locale}) {
    final DateFormat _dateFormat = DateFormat('dd/MM/yyyy', locale);
    return _dateFormat.format(dateTime);
  }

  /// Example of GraphQl returned String = '12/25/2021 5:45 PM'
  /// Example of GraphQl returned String With Secs = '12/25/2021 5:45:30 PM'
  /// This function will return the equivalent DateTime class
  DateTime parseGraphQlDateTime(String rawDateTimeStringGraphQl) {
    final includesSeconds =
        ':'.allMatches(rawDateTimeStringGraphQl).length == 2;
    final formatString = 'M/d/y h:m${includesSeconds ? ':s' : ''} a';
    return DateFormat(formatString, 'en').parse(rawDateTimeStringGraphQl);
  }
}
