import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/keypad/hijri_date_picker.dart';

import '../input_fields/georgian_date_picker.dart' as georgian_calender;

class CrayonPaymentCupertinoDatePicker extends StatelessWidget {
  final Function(DateTime date) onDateSelected;
  final Function? cancelButtonCallback;
  final Function? doneButtonCallback;
  final bool? hasActionButton;
  final bool isHijri;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  CrayonPaymentCupertinoDatePicker(
    this.onDateSelected,
    this.isHijri, {
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.cancelButtonCallback,
    this.doneButtonCallback,
    this.hasActionButton,
  }) : super(key: key);

  void _onCancelPressed() {
    if (cancelButtonCallback != null) cancelButtonCallback!();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('CrayonDataCupertinoCalendar'),
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (hasActionButton != null && hasActionButton!)
          Container(height: 1, color: Color(0xffF6F5F2)),
        if (hasActionButton != null && hasActionButton!)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CrayonPaymentTextButton(
                  text: 'cancel'.tr,
                  color: Color(0xff937206),
                  onPressed: _onCancelPressed,
                ),
                CrayonPaymentTextButton(
                  text: 'done'.tr,
                  onPressed: _onDonePressed,
                  color: Color(0xff937206),
                )
              ],
            ),
          ),
        if (hasActionButton != null && hasActionButton!)
          Container(height: 1, color: Color(0xffF6F5F2)),
        Container(
          height: 216,
          child: !isHijri
              ? Directionality.of(context) == TextDirection.ltr
                  ? CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: initialDate,
                      maximumDate: lastDate,
                      minimumDate: firstDate,
                      onDateTimeChanged: (DateTime value) {
                        onDateSelected(value);
                      },
                    )
                  : georgian_calender.CupertinoDatePicker(
                      mode: georgian_calender.CupertinoDatePickerMode.date,
                      initialDateTime: initialDate,
                      maximumDate: lastDate,
                      minimumDate: firstDate,
                      onDateTimeChanged: (DateTime value) {
                        onDateSelected(value);
                      },
                    )
              : HijriCupertinoDatePicker(initialDate, (value) {
                  onDateSelected(value);
                }),
        ),
      ],
    );
  }

  void _onDonePressed() {
    if (doneButtonCallback != null) doneButtonCallback!();
  }
}
