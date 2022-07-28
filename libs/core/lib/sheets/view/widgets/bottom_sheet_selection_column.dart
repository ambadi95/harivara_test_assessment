import 'package:flutter/material.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/filter_date_button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/top_bars.dart';
import 'package:widget_library/buttons/bordered_button.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:shared_data_models/date_filter/date_filter_type.dart';

class BottomSheetSelectionColumn extends StatefulWidget {
  final CrayonPaymentBottomSheetCoordinator coordinator;
  final SheetSelection _sheetState;

  const BottomSheetSelectionColumn(
    this.coordinator,
    this._sheetState, {
    Key? key,
  }) : super(key: key);

  @override
  _BottomSheetSelectionColumnState createState() =>
      _BottomSheetSelectionColumnState();
}

class _BottomSheetSelectionColumnState
    extends State<BottomSheetSelectionColumn> {
  static const String _identifier = 'BottomSheetSelectionColumn';

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const Key('${_identifier}'),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CloseButtonTopRow(
          onClose: () => widget.coordinator.goBack(),
        ),
        if (widget._sheetState.buttonOptions != null) ...[
          ...widget._sheetState.buttonOptions!
              .map(
                (buttonOption) => _buildButton(
                  context,
                  widget._sheetState.buttonOptions!.indexOf(buttonOption),
                ),
              )
              .toList(),
        ],
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    int index,
  ) {
    FilterDateButtonOptions buttonOptions =
        widget._sheetState.buttonOptions!.elementAt(index);

    return Padding(
      padding: index != 0
          ? _BottomSheetSelectionPadding.buttonPadding
          : _BottomSheetSelectionPadding.firstButtonPadding,
      child: BorderedButton(
        height: 35,
        key: Key('${_identifier}_Button_${index}'),
        title: buttonOptions.text,
        onTap: () => _onTap(
          index,
          buttonOptions,
        ),
        foreGroundColor: _checkIndex(buttonOptions)
            ? CrayonPaymentColors.crayonPayment040404
            : Colors.transparent,
        buttonTextStyle: Theme.of(context).textTheme.headline4!.copyWith(
              color: _checkIndex(buttonOptions)
                  ? CrayonPaymentColors.crayonPayment040404
                  : CrayonPaymentColors.floralWhite,
            ),
      ),
    );
  }

  void _onTap(int index, FilterDateButtonOptions buttonOptions) {
    setState(() {
      selectedIndex = index;
    });
    buttonOptions.onPressed(buttonOptions.filterType);
  }

  bool _checkIndex(FilterDateButtonOptions buttonOption) {
    if (buttonOption.filterType is SelectDates &&
        buttonOption.selectedFilterType is SelectDates) {
      return true;
    }
    return buttonOption.filterType == buttonOption.selectedFilterType;
  }
}

class _BottomSheetSelectionPadding {
  static const EdgeInsets buttonPadding = EdgeInsets.fromLTRB(70, 10, 70, 10);
  static const EdgeInsets firstButtonPadding =
      EdgeInsets.fromLTRB(70, 0, 70, 10);
}
