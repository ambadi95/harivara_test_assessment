import 'package:intl/intl.dart';

extension DateTimeFormateUtil on DateTime {
  /// Returns string like: `Sept 26, 2021`
  String toFullMonthTime() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }

  /// Returns string like: `Sept 26, 2021`
  String toShortTime() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Returns string like: `2021-05-25`
  String toShortDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Returns a string like '2021-05-25 06:42:52
  String toShortDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }

  /// Formats the date based on passed argument
  String toFormattedDate(String format) {
    return DateFormat(format).format(this);
  }

  ///Our backend expecting UTC DateTime format
  ///it will format like this "yyyy-MM-ddTHH:mm:ss.SSSZ"
  String toBackendDateTimeFormat() {
    assert(isUtc, 'Backend side expecting utc date!!!');
    return toIso8601String();
  }

  bool isYesterday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day - 1;
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  DateTime toOnlyDate() {
    return DateTime(year, month, day);
  }
}
