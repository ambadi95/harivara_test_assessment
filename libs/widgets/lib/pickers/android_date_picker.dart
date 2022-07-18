import 'package:core/typedefs/callback_typedefs.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';

Widget androidDatePickerWidget(
  BuildContext context, {
  required TransactionFilteringCallBack callBack,
  TextStyle? textStyle,
}) {
  final String _identifier = 'AndroidDatePickerWidget';
  initializeDateFormatting();
  return SfDateRangePicker(
    key: Key('$_identifier'),
    onSelectionChanged: (dates) {
      final dateRange = dates.value as PickerDateRange;

      if ((dateRange.startDate != null) && (dateRange.endDate != null)) {
        callBack(dateRange.startDate, dateRange.endDate);
      }
    },
    selectionMode: DateRangePickerSelectionMode.range,
    headerStyle: DateRangePickerHeaderStyle(
      textStyle: textStyle ??
          Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w600),
    ),
    todayHighlightColor: CrayonPaymentColors.crayonPaymentGold,
    selectionColor: CrayonPaymentColors.crayonPaymentGold,
    startRangeSelectionColor: CrayonPaymentColors.crayonPaymentGold,
    endRangeSelectionColor: CrayonPaymentColors.crayonPaymentGold,
    rangeSelectionColor: CrayonPaymentColors.crayonPaymentGold.withOpacity(0.15),
  );
}
