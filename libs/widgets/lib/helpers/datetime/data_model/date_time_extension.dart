class DateTimeExtension extends DateTime {
  DateTimeExtension(int year, int month, int day) : super(year, month, day);

  @override
  String toString() {
    return '$day/$month/$year';
  }
}
