import 'package:core/sheets/data_model/multi_selection_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'date_filter_type.freezed.dart';

@freezed
class DateFilterType extends Filter with _$DateFilterType {
  const DateFilterType._();

  const factory DateFilterType.currentMonth({
    @Default(true) bool selectionState,
  }) = CurrentMonth;

  const factory DateFilterType.previousMonth({
    @Default(false) bool selectionState,
  }) = PreviousMonth;

  const factory DateFilterType.lastThreeMonths({
    @Default(false) bool selectionState,
  }) = LastThreeMotnhs;

  const factory DateFilterType.lastYear({
    @Default(false) bool selectionState,
  }) = LastYear;

  const factory DateFilterType.allTransactions({
    @Default(false) bool selectionState,
  }) = AllTransactions;

  const factory DateFilterType.selectDates({
    @Default(false) bool selectionState,
    DateTime? endDate,
    DateTime? startDate,
  }) = SelectDates;

  FilterDates get getFilterDates => when(
        currentMonth: (_) => FilterDates(
          endDate: DateTime.now(),
          startDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
        ),
        previousMonth: (_) => FilterDates(
          endDate: DateTime(DateTime.now().year, DateTime.now().month, 0),
          startDate: DateTime(DateTime.now().year, DateTime.now().month - 1, 1),
        ),
        lastThreeMonths: (_) => FilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 90),
          ),
        ),
        lastYear: (_) => FilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
        allTransactions: (_) => FilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
        selectDates: (_, endDate, startDate) => FilterDates(
          endDate: endDate!,
          startDate: startDate!,
        ),
      );

  @override
  String toString() {
    return when(
      currentMonth: (_) => 'transaction-filter-screen-current-month'.tr,
      previousMonth: (_) => 'transaction-filter-screen-previous-month'.tr,
      lastThreeMonths: (_) => 'transaction-filter-screen-last-three-months'.tr,
      lastYear: (_) => 'transaction-filter-screen-last-year'.tr,
      allTransactions: (_) => 'transaction-filter-screen-all'.tr,
      selectDates: (_, __, ___) => 'transaction-filter-screen-select-dates'.tr,
    );
  }

  @override
  Filter withNewSelectionState({bool? selectionState}) {
    if (selectionState == null) {
      return this;
    }
    return when(
      currentMonth: (_) =>
          DateFilterType.currentMonth(selectionState: selectionState),
      previousMonth: (_) =>
          DateFilterType.previousMonth(selectionState: selectionState),
      lastThreeMonths: (_) =>
          DateFilterType.lastThreeMonths(selectionState: selectionState),
      lastYear: (_) => DateFilterType.lastYear(selectionState: selectionState),
      allTransactions: (_) =>
          DateFilterType.allTransactions(selectionState: selectionState),
      selectDates: (_, end, start) => DateFilterType.selectDates(
        selectionState: selectionState,
        startDate: start,
        endDate: end,
      ),
    );
  }
}

class FilterDates {
  final DateTime startDate;
  final DateTime endDate;

  FilterDates({
    required this.startDate,
    required this.endDate,
  });
}
