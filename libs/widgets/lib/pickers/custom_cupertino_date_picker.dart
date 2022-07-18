import 'package:core/typedefs/callback_typedefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/helpers/datetime/common.dart';
import 'package:widget_library/helpers/datetime/data_model/date_time_extension.dart';
import 'package:widget_library/helpers/datetime/date_time_utils.dart';

import 'widgets/action_buttons.dart';

class CustomCupertinoDatePicker extends StatefulWidget {
  final VoidCallback onCancel;
  final DoneCallback onDone;
  final OnChangeCallback? onChange;
  static const double pickerHeight = 280;

  const CustomCupertinoDatePicker({
    Key? key,
    required this.onCancel,
    required this.onDone,
    this.onChange,
  }) : super(key: key);

  @override
  _CustomCupertinoDatePickerState createState() =>
      _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  final String _identifier = 'CustomCupertinoDatePicker';
  final List<int> _months = [];
  final List<int> _years = [];
  final List<int> _days = [];

  int _monthIndex = 0;
  int _yearIndex = 0;
  int _dayIndex = 0;

  @override
  void initState() {
    super.initState();
    _buildMonthsAndYears(DateTime.now().year);
    _buildDays(DateTime.now().month);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: CustomCupertinoDatePicker.pickerHeight,
          color: Colors.white,
          width: constraints.maxWidth,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CancelButton(
                      identifier: _identifier,
                      onCancelCallback: widget.onCancel,
                    ),
                    DoneButton(
                      identifier: _identifier,
                      onDoneCallback: widget.onDone,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoPicker.builder(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          childCount: _months.length,
                          onSelectedItemChanged: (index) {
                            _monthIndex = index;
                            _buildDays(_months[index]);
                            _updateDate();
                          },
                          itemBuilder: (context, index) {
                            return _pickerRow(
                              '${monthsAsString[index]}'.padLeft(2, '0'),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker.builder(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          childCount: _days.length,
                          onSelectedItemChanged: (index) {
                            _dayIndex = index;
                            _updateDate();
                          },
                          itemBuilder: (context, index) {
                            return _pickerRow(
                              '${_days[index]}'.padLeft(2, '0'),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker.builder(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          childCount: _years.length,
                          onSelectedItemChanged: (index) {
                            _yearIndex = index;
                            _buildMonthsAndYears(_years[index]);
                            _buildDays(_months[_monthIndex]);
                            _updateDate();
                          },
                          itemBuilder: (context, index) {
                            return _pickerRow('${_years[index]}');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _pickerRow(String tex) {
    return Center(
      child: Text(
        tex,
        style: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(fontSize: 18, color: Colors.black),
      ),
    );
  }

  void _buildMonthsAndYears(int year) {
    setState(() {
      if (_years.isEmpty) {
        for (int i = year - 5; i <= year; i++) {
          _years.add(i);
        }
      }
      _months.clear();

      for (int i = 1; i <= 12; i++) {
        _months.add(i);
      }
    });
  }

  void _buildDays(int month) {
    setState(() {
      var isLeap = isLeapYear(_years[_yearIndex]);
      var numberOfDays = 0;
      var index = _months[_monthIndex];

      if (isLeap) {
        if (index == 2) {
          numberOfDays = 29;
        } else {
          numberOfDays = getDaysOfMonth(index);
        }
      } else if (index == 2) {
        numberOfDays = 28;
      } else {
        numberOfDays = getDaysOfMonth(index);
      }

      if (_days.isEmpty) {
        for (int i = 1; i <= numberOfDays; i++) {
          _days.add(i);
        }
      }
      if (month == DateTime.now().month) {
        _days.clear();

        for (int i = 1; i <= numberOfDays; i++) {
          _days.add(i);
        }
      } else {
        _days.clear();

        for (int i = 1; i <= numberOfDays; i++) {
          _days.add(i);
        }
      }
    });
  }

  void _updateDate() {
    if (widget.onChange != null) {
      widget.onChange!(
        DateTimeExtension(
          _years[_yearIndex],
          _months[_monthIndex],
          _days[_dayIndex],
        ),
      );
    }
  }
}
