import 'package:intl/intl.dart';

class DateTimeFormatter {
  String formatDashYMD(DateTime dateTime) {
    final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
    return _dateFormat.format(dateTime);
  }

  /// Example of GraphQl returned String = '1/14/2021 5:45:06 PM'
  /// This function will return the equivalent DateTime class
  DateTime parseGraphQlDateTime(String rawDateTimeStringGraphQl) {
    String formatString = 'y-M-d h:m:s';

    if (rawDateTimeStringGraphQl.contains('/')) {
      formatString = 'M/d/y h:m:s a';
    }
    return DateFormat(formatString, 'en').parse(
      rawDateTimeStringGraphQl.replaceAll('T', ' '),
    );
  }
}
