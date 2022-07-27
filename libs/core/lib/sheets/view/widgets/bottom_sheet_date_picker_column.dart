import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/top_bars.dart';
import 'package:core/sheets/view/widgets/top_titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/helpers/datetime/data_model/date_time_extension.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';
import 'package:widget_library/pickers/android_date_picker.dart';
import 'package:widget_library/pickers/cupertino_date_picker.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

import '../../coordinator/crayon_payment_bottom_sheet_coordinator.dart';

enum DateFieldIndex { invalid, start, end }

const String _dateSuggestion = 'DD/MM/YY';

class BottomSheetDatePickerColumn extends StatefulWidget {
  final CrayonPaymentBottomSheetCoordinator _coordinator;
  final SheetDatePicker _state;

  const BottomSheetDatePickerColumn(
    this._coordinator,
    this._state, {
    Key? key,
  }) : super(key: key);

  @override
  _BottomSheetDatePickerColumnState createState() =>
      _BottomSheetDatePickerColumnState();
}

class _BottomSheetDatePickerColumnState
    extends State<BottomSheetDatePickerColumn>
    with SingleTickerProviderStateMixin {
  static const String _identifier = 'BottomSheetDatePickerColumn';
  DateTime? _startDate;
  DateTime? _endDate;

  DateFieldIndex selectedIndex = DateFieldIndex.invalid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      key: const Key('${_identifier}'),
      children: [
        CloseButtonTopRow(
          onClose: () => widget._coordinator.goBack(),
        ),
        DateTitle(),
        spaceH20(),
        _buildNativePicker(
          context,
          widget._coordinator,
        ),
      ],
    );
  }

  Widget _buildNativePicker(
    BuildContext context,
    CrayonPaymentBottomSheetCoordinator coordinator,
  ) {
    var devicePlatform = Theme.of(context).platform;

    if (devicePlatform == TargetPlatform.android) {
      return androidDatePickerWidget(
        context,
        callBack: (startDate, endDate) {
          widget._state.callbackAfterDateIsSelected?.call(startDate, endDate);
        },
      );
    } else {
      return Column(
        children: [
          _buildDateFields(context),
          _buildCupertionPicker(context, coordinator),
        ],
      );
    }
  }

  Widget _buildDateFields(BuildContext context) {
    return Row(
      key: Key('${_identifier}_DateFields'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateField(context, DateFieldIndex.start),
        _buildArrowIcon(),
        _buildDateField(context, DateFieldIndex.end),
      ],
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: _BottomSheetDatePickerPadding.iconPadding,
      child: SvgPicture.asset(CrayonPaymentIconPath.iconDropDown),
    );
  }

  Widget _buildDateField(BuildContext context, DateFieldIndex index) {
    return Expanded(
      child: Container(
        height: 54,
        alignment: Alignment.center,
        child: TextField(
          readOnly: true,
          textCapitalization: TextCapitalization.words,
          cursorColor: CrayonPaymentColors.crayonPayment0A0403,
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            hintText: _displayDate(index),
            contentPadding: _BottomSheetDatePickerPadding.dateFieldPadding,
            enabledBorder: _checkIndex(index) ? _focusedBorder : _defaultBorder,
            focusedBorder: _checkIndex(index) ? _focusedBorder : _defaultBorder,
          ),
          onTap: () => _toDoOnTap(index),
        ),
      ),
    );
  }

  void _toDoOnTap(DateFieldIndex index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _buildCupertionPicker(
    BuildContext context,
    CrayonPaymentBottomSheetCoordinator coordinator,
  ) {
    return CupertinoDatePickerWidget(
      key: Key('${_identifier}_CupertinoDatePicker'),
      onCancelCallback: () {
        coordinator.goBack();
      },
      onChangeCallback: (date) {
        if (selectedIndex == DateFieldIndex.start) {
        //  _startDate = date;
        }

        if (selectedIndex == DateFieldIndex.end) {
          //_endDate = date;
        }
        widget._coordinator.updateDateFields(_startDate, _endDate);
      },
      onDoneCallback: () {
        if (_startDate != null && _endDate != null) {
          widget._state.callbackAfterDateIsSelected?.call(_startDate, _endDate);
        }
      },
    );
  }

  bool _checkIndex(DateFieldIndex newIndex) {
    return newIndex == selectedIndex ? true : false;
  }

  String _displayDate(DateFieldIndex index) {
    if (index == DateFieldIndex.start) {
      if (widget._state.startDate != null) {
        DateTime getDate = widget._state.startDate!;
        DateTimeExtension dateHolder =
            DateTimeExtension(getDate.year, getDate.month, getDate.day);
        return dateHolder.toString();
      } else {
        return _dateSuggestion;
      }
    }

    if (widget._state.endDate != null) {
      DateTime getDate = widget._state.endDate!;
      DateTimeExtension dateHolder =
          DateTimeExtension(getDate.year, getDate.month, getDate.day);
      return dateHolder.toString();
    } else {
      return _dateSuggestion;
    }
  }
}

InputBorder get _focusedBorder => OutlineInputBorder(
      borderSide: BorderSide(color: CrayonPaymentColors.crayonPayment0A0403, width: 2),
      borderRadius: BorderRadius.circular(8),
    );

InputBorder get _defaultBorder => OutlineInputBorder(
      borderSide: BorderSide(color: CrayonPaymentColors.crayonPayment0A0403, width: 1),
      borderRadius: BorderRadius.circular(8),
    );

class _BottomSheetDatePickerPadding {
  static const EdgeInsets dateFieldPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 12,
  );
  static const EdgeInsets iconPadding = EdgeInsets.only(
    left: 10,
    right: 10,
  );
}
