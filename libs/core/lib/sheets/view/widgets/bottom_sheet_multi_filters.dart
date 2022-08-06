import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/multi_selection_category.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/date_filter/date_filter_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/expandable_details/expandable_details.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_bottom_row.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/pickers/android_date_picker.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetMultiFilters extends StatefulWidget {
  final SheetMultiFilters _sheetState;
  final CrayonPaymentBottomSheetCoordinator coordinator;

  const BottomSheetMultiFilters(
    this.coordinator,
    this._sheetState, {
    Key? key,
  }) : super(key: key);

  @override
  _BottomSheetMultiFiltersState createState() =>
      _BottomSheetMultiFiltersState();
}

class _BottomSheetMultiFiltersState extends State<BottomSheetMultiFilters> {
  final double _selectoSize = 24.0;
  final double _actionButtonHeight = 32.0;
  final double _actionButtonWidth = 86.0;
  static final String _identifier = 'BottomSheetMultiFilters';

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 700),
      () => widget.coordinator.displayDatePickerIfAvailable(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: Key('${_identifier}'),
      shrinkWrap: true,
      children: [
        _buildTopLine,
        if (widget._sheetState.title != null) ...[
          dynamicHSpacer(26),
          _buildTitle(widget._sheetState.title!),
        ],
        dynamicHSpacer(18),
        _getDivider,
        spaceH30(),
        ..._buildFilters,
        _getDivider,
        dynamicHSpacer(23),
        _buildActionButtons(),
      ],
    );
  }

  Widget get _buildTopLine {
    return Align(
      child: Container(
        key: Key('${_identifier}_TopLine'),
        height: 4.0,
        width: 46.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: CrayonPaymentColors.crayonPayment0A0403,
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Align(
      child: CrayonPaymentText(
        key: Key('${_identifier}_Title'),
        text: TextUIDataModel(
          title,
          styleVariant: CrayonPaymentTextStyleVariant.bodyText1,
          color: CrayonPaymentColors.crayonPayment0A0403,
        ),
      ),
    );
  }

  Widget get _getDivider => SizedBox(
        height: 1,
        child: OverflowBox(
          maxWidth: MediaQuery.of(context).size.width,
          child: Divider(
            color: CrayonPaymentColors.boxDecColor,
            thickness: 1.5,
          ),
        ),
      );

  List<Widget> get _buildFilters => widget._sheetState.categories!
      .map(
        (item) => _getFilterCategory(
          item,
        ),
      )
      .toList();

  Widget _getFilterCategory(MultiSelectionCategory item) => Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ExpandableDetails(
          key: item.key,
          topTitleText: item.category.toString(),
          topTitleColor: CrayonPaymentColors.crayonPayment0A0403,
          topTitleStyleVariant: CrayonPaymentTextStyleVariant.bodyText1,
          boxColor: Colors.white,
          boxPadding: EdgeInsets.symmetric(horizontal: 16),
          dividerColor: CrayonPaymentColors.floralWhite,
          displayDividerBeforeItems: true,
          gestureDetectorOnWholeContainer: false,
          itemsWhenExpanded: (item.category.filters
              .map<Widget>(
                (filter) => _getSubfilter(
                  item,
                  filter,
                ),
              )
              .toList()),
          expandDetailsBottomRow: [],
        ),
      );

  Widget _getSubfilter(
    MultiSelectionCategory item,
    Filter filter,
  ) {
    return filter is SelectDates
        ? _buildDatePickerSubfilter(item, filter)
        : _buildDefaultSubfilter(item, filter);
  }

  Widget _buildDatePickerSubfilter(
    MultiSelectionCategory item,
    Filter filter,
  ) =>
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _buildDefaultSubfilter(
              item,
              filter,
            ),
            if (widget._sheetState.displayDateFilter) ...[
              spaceH20(),
              _displaySelectedDates,
              spaceH10(),
              _getDivider,
              _buildDatePicker(),
            ],
          ],
        ),
      );

  Widget _buildDefaultSubfilter(
    MultiSelectionCategory item,
    Filter filter,
  ) =>
      ExpandDetailsBottomRow(
        leftSide: filter.toString(),
        textColor: Colors.black54,
        padding: EdgeInsets.symmetric(vertical: 14.0),
        rightSide: item.supportsMultiSelection
            ? _buildSquareSelector(
                item,
                filter,
              )
            : _buildCircleSelector(
                item,
                filter,
              ),
      );

  Widget _buildCircleSelector(MultiSelectionCategory item, Filter filter) =>
      GestureDetector(
        onTap: () => widget.coordinator.changeFilterState(item, filter),
        child: Container(
          height: _selectoSize,
          width: _selectoSize,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: filter.selectionState ? 5 : 1,
              color: filter.selectionState
                  ? CrayonPaymentColors.crayonPayment0A0403
                  : CrayonPaymentColors.crayonPayment040404,
            ),
          ),
        ),
      );

  Widget _buildSquareSelector(MultiSelectionCategory item, Filter filter) =>
      Container(
        height: _selectoSize,
        width: _selectoSize,
        child: Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: filter.selectionState,
            activeColor: CrayonPaymentColors.boxDecColor,
            onChanged: (bool? value) {
              widget.coordinator.changeFilterState(item, filter);
            },
          ),
        ),
      );

  Widget _buildActionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget._sheetState.leftActionButton != null)
            Flexible(
              child: _getButtonType(
                widget._sheetState.leftActionButton!,
              ),
            ),
          Spacer(),
          if (widget._sheetState.rightActionButton != null)
            Flexible(
              child: _getButtonType(
                widget._sheetState.rightActionButton!,
              ),
            ),
        ],
      );

  Widget _getButtonType(MultiSelectionButton buttonOptions) {
    return Container(
      width: _actionButtonWidth,
      height: _actionButtonHeight,
      child: buttonOptions.textButton
          ? CrayonPaymentDockedButton.borderless(
              title: buttonOptions.text,
              onPressed: () =>
                  buttonOptions.onPressed(widget._sheetState.categories!),
            )
          : CrayonPaymentDockedButton(
              title: buttonOptions.text,
              onPressed: () =>
                  buttonOptions.onPressed(widget._sheetState.categories!),
            ),
    );
  }

  Widget _buildDatePicker() => SizedBox(
        key: Key('${_identifier}_DatePicker'),
        height: 300,
        child: OverflowBox(
          maxWidth: MediaQuery.of(context).size.width - 20,
          child: androidDatePickerWidget(
            context,
            callBack: (startDate, endDate) => widget.coordinator.registerDates(
              startDate,
              endDate,
            ),
          ),
        ),
      );

  Widget get _displaySelectedDates => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget._sheetState.startDate != null)
            _buildDateTitle(
              widget._sheetState.startDate!,
              'startDate',
            ),
          if ((widget._sheetState.startDate != null) &&
              (widget._sheetState.endDate != null))
            _buildDateTitle(' - ', 'dash'),
          if (widget._sheetState.endDate != null)
            _buildDateTitle(
              widget._sheetState.endDate!,
              'endDate',
            ),
        ],
      );

  Widget _buildDateTitle(String date, String key) {
    return CrayonPaymentText(
      key: Key('${_identifier}_$key'),
      text: TextUIDataModel(
        date,
        textAlign: TextAlign.center,
        styleVariant: CrayonPaymentTextStyleVariant.headline4,
        color: CrayonPaymentColors.boxDecColor,
      ),
    );
  }
}
