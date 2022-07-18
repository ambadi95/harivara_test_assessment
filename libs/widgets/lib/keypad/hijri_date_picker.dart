import 'package:flutter/cupertino.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriCupertinoDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateTimeChanged;

  HijriCupertinoDatePicker(
    this.initialDate,
    this.onDateTimeChanged,
  );

  @override
  _HijriCupertinoDatePickerState createState() =>
      _HijriCupertinoDatePickerState();
}

class _HijriCupertinoDatePickerState extends State<HijriCupertinoDatePicker> {
  int _selectedYearIndex = 0;
  int _selectedMonthIndex = 0;
  int _selectedDateIndex = 0;

  int _selectedYear = 0;
  int _selectedMonth = 0;
  int _selectedDate = 0;

  var hijriYears = [];
  var hijriDays = [];
  var leapYears = [2, 5, 8, 10, 13, 16, 19, 21, 24, 27, 29];
  var thirtyDaysMonth = [0, 2, 4, 6, 8, 10];
  var hijriMonths = [
    'Muharram',
    'Safar',
    'Rabi Al-Awwal',
    'Rabi Al-Thani',
    'Jumada Al-Awwal',
    'Jumada Al-Thani',
    'Rajab',
    'Shaban',
    'Ramadan',
    'Shawwal',
    'Dhu Al-Qadah',
    'Dhu Al-Hijjah',
  ];

  @override
  void initState() {
    super.initState();
    var _today = HijriCalendar.now();
    for (int i = 87; i >= 0; i--) {
      hijriYears.add(_today.hYear - i);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle;

    if (widget.initialDate != null && _selectedYear == 0) {
      var hijriDate =
          HijriCalendar.fromDate(widget.initialDate!).toFormat('MMMM/dd/yyyy');
      var hijriDateComponents = hijriDate.split('/');
      var hijriMonth = hijriDateComponents[0];
      var hijriDay = hijriDateComponents[1];
      var hijriYear = hijriDateComponents[2];

      _selectedYear = int.parse(hijriYear);
      _selectedYearIndex = hijriYears.indexOf(_selectedYear);

      _selectedMonthIndex = hijriMonths.indexOf(hijriMonth);
      _selectedMonth = _selectedMonthIndex + 1;

      _selectedDate = int.parse(hijriDay);
      _selectedDateIndex = hijriDays.indexOf(_selectedDate);
    }
    hijriDays = _getHijriDays(_selectedMonthIndex, _selectedYear);

    return Container(
      height: 327,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CupertinoPicker(
              itemExtent: 36.0,
              looping: true,
              offAxisFraction: -0.5,
              scrollController:
                  FixedExtentScrollController(initialItem: _selectedMonthIndex),
              selectionOverlay: Container(
                margin: EdgeInsetsDirectional.only(start: 16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8),
                    topStart: Radius.circular(8),
                  ),
                ),
              ),
              onSelectedItemChanged: (int index) {
                _selectedMonthIndex = index;
                _selectedMonth = _selectedMonthIndex + 1;
                widget.onDateTimeChanged(
                  HijriCalendar().hijriToGregorian(
                    _selectedYear,
                    _selectedMonth,
                    _selectedDate,
                  ),
                );
                setState(() {});
              },
              children:
                  new List<Widget>.generate(hijriMonths.length, (int index) {
                return new Align(
                  alignment: AlignmentDirectional.center,
                  child: new Text(
                    hijriMonths[index],
                    style: style,
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 36.0,
              looping: true,
              selectionOverlay: Container(
                color: CupertinoColors.systemGrey.withOpacity(0.2),
              ),
              scrollController:
                  FixedExtentScrollController(initialItem: _selectedDateIndex),
              onSelectedItemChanged: (int index) {
                _selectedDateIndex = index;
                _selectedDate = hijriDays[_selectedDateIndex];
                widget.onDateTimeChanged(
                  HijriCalendar().hijriToGregorian(
                    _selectedYear,
                    _selectedMonth,
                    _selectedDate,
                  ),
                );
                setState(() {});
              },
              children:
                  new List<Widget>.generate(hijriDays.length, (int index) {
                return new Center(
                  child: new Text(
                    hijriDays[index].toString(),
                    style: style,
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 36.0,
              looping: true,
              offAxisFraction: 0.5,
              selectionOverlay: Container(
                margin: EdgeInsetsDirectional.only(end: 16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(8),
                    topEnd: Radius.circular(8),
                  ),
                ),
              ),
              scrollController:
                  FixedExtentScrollController(initialItem: _selectedYearIndex),
              onSelectedItemChanged: (int index) {
                _selectedYearIndex = index;
                _selectedYear = hijriYears[_selectedYearIndex];
                widget.onDateTimeChanged(
                  HijriCalendar().hijriToGregorian(
                    _selectedYear,
                    _selectedMonth,
                    _selectedDate,
                  ),
                );
                setState(() {});
              },
              children:
                  new List<Widget>.generate(hijriYears.length, (int index) {
                return Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: new Text(
                    hijriYears[index].toString(),
                    style: style,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  List _getHijriDays(int month, int year) {
    var days = [];
    var numberOfDays = 29;
    if (thirtyDaysMonth.contains(month)) {
      numberOfDays = 30;
    }
    var leapYearMod = year % 30;
    if (month == 11 && leapYears.contains(leapYearMod)) {
      numberOfDays = 30;
    }
    for (int i = 1; i <= numberOfDays; i++) {
      days.add(i);
    }
    return days;
  }
}
