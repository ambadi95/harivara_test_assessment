import 'dart:async';

import 'package:core/formatters/date_time_formatter.dart';
import 'package:core/logging/logger.dart';
import 'package:core/sheets/data_model/multi_selection_category.dart';
import 'package:core/sheets/navigation/crayon_payment_bottom_sheet_navigation_handler.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/utils/extensions/list_extensions.dart';
import 'package:shared_data_models/date_filter/date_filter_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:task_manager/task.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

import '../data_model/loan_payment.dart';

class CrayonPaymentBottomSheetCoordinator
    extends BaseViewModel<CrayonPaymentBottomSheetState> {
  final CrayonPaymentBottomSheetNavigationHandler _navigationHandler;

  CrayonPaymentBottomSheetCoordinator(this._navigationHandler)
      : super(const CrayonPaymentBottomSheetState.waitingState(
            immediateCallback: null));

  Future<void> setUpState(CrayonPaymentBottomSheetState sheetState) async {
    await sheetState.maybeWhen(
      waitingState: (immediateCallback, _, __, ___, ____) async {
        state = sheetState;
        if (immediateCallback != null) {
          await _executeCallback(immediateCallback);
        }
      },
      infoState: (_,isSvg, __, ___, additionalText, ____, autoCloseAfter, _____) {
        state = sheetState;
        if (autoCloseAfter != null) {
          _startTimerToClose(autoCloseAfter);
        }
      },
      infoStateWrap: (_, __, ___, ____, autoCloseAfter, ______, _______) {
        state = sheetState;
        if (autoCloseAfter != null) {
          _startTimerToClose(autoCloseAfter);
        }
      },
      orElse: () {
        state = sheetState;
      },
    );
  }

  void forceLoading({String? text}) {
    state = CrayonPaymentBottomSheetState.simpleWatingState(waitingText: text);
  }

  Future<void> _executeCallback(
    Future<CrayonPaymentBottomSheetState?>? Function() immediateCallback,
  ) async {
    try {
      final result = await immediateCallback.call();
      if (result is CloseBottomSheet) {
        await _handleCloseBottomSheet(result);
        return;
      } else if (result == null) {
        _navigationHandler.navigateBack();
        return;
      }
      state = result;
    } catch (e) {
      state = CrayonPaymentBottomSheetState.infoState(
        bottomSheetIcon: CrayonPaymentBottomSheetErrorIcon(),
        title: 'Something went wrong',
        subtitle: 'Please try again later',
        disableCloseButton: true,
      );
    }
  }

  void _startTimerToClose(Duration timeToClose) {
    const closeState =
        CrayonPaymentBottomSheetState.closeSheet() as CloseBottomSheet;
    Timer(timeToClose, () => _handleCloseBottomSheet(closeState));
  }

  Future<void> _handleCloseBottomSheet(CloseBottomSheet closeState) async {
    if (_navigationHandler.isBottomSheetOpen) {
      await closeState.callbackBeforeClosingSheet?.call();
      _navigationHandler.navigateBack();
      await closeState.callbackAfterClosingSheet?.call();
    }
  }

  void updateDateFields(DateTime? startDate, DateTime? endDate) {
    if (state is SheetDatePicker) {
      final currentState = state as SheetDatePicker;
      state = currentState.copyWith(
        startDate: startDate,
        endDate: endDate,
      );
    }
  }

  void goBack() {
    _navigationHandler.navigateBack();
  }

  void changeFilterState(
    MultiSelectionCategory categoryOfFilter,
    Filter selectedFilter,
  ) {
    final newCategories = <MultiSelectionCategory>[];
    List<Filter> newFilters = [];
    var currentState = state as SheetMultiFilters;

    if (selectedFilter is SelectDates) {
      state = currentState.copyWith(displayDateFilter: true);
    }

    final Category selectedCategory = currentState.categories!
        .firstWhere(
          (element) => element.category == categoryOfFilter.category,
        )
        .category;

    newFilters = categoryOfFilter.supportsMultiSelection
        ? _changeMultiSelectionFilterState(selectedCategory, selectedFilter)
        : _changeSingleSelectionFilterState(selectedCategory, selectedFilter);

    currentState.categories!.forEach(
      (element) => categoryOfFilter.category == element.category
          ? newCategories.add(
              MultiSelectionCategory(
                supportsMultiSelection: element.supportsMultiSelection,
                category: categoryOfFilter.category
                    .withNewFilters(filters: newFilters),
              ),
            )
          : newCategories.add(element),
    );

    currentState = state as SheetMultiFilters;
    state = currentState.copyWith(
      categories: newCategories,
    );
  }

  List<Filter> _changeSingleSelectionFilterState(
    Category categoryOfFilter,
    Filter selectedFilter,
  ) {
    final List<Filter> newFilters = [];
    var selectDatesFilterFinder = false;

    categoryOfFilter.filters.forEach((filter) {
      /// SelectedFilter can consists the startDate or endDate
      /// so the equality between selectedFilter and filter is not valid anymore
      if ((selectedFilter is SelectDates) && (filter is SelectDates)) {
        selectDatesFilterFinder = true;
        newFilters.add(
          selectedFilter.copyWith(selectionState: true),
        );
      } else {
        selectedFilter == filter
            ? newFilters.add(
                selectedFilter.withNewSelectionState(selectionState: true),
              )
            : newFilters.add(
                filter.withNewSelectionState(selectionState: false),
              );
      }
    });

    if (selectDatesFilterFinder && selectedFilter is! SelectDates) {
      state = (state as SheetMultiFilters).copyWith(displayDateFilter: false);
    }
    return newFilters;
  }

  List<Filter> _changeMultiSelectionFilterState(
    Category categoryOfFilter,
    Filter selectedFilter,
  ) {
    final List<Filter> newFilters = [];

    categoryOfFilter.filters.forEach(
      (filter) => selectedFilter == filter
          ? newFilters.add(
              filter.withNewSelectionState(
                  selectionState: !filter.selectionState),
            )
          : newFilters.add(filter),
    );
    return newFilters;
  }

  void registerDates(
    DateTime? startDate,
    DateTime? endDate,
  ) {
    final formatter = DateTimeFormatter();
    final currenState = state as SheetMultiFilters;

    state = currenState.copyWith(
      startDate:
          startDate != null ? formatter.formatBackslashDMY(startDate) : null,
      endDate: endDate != null ? formatter.formatBackslashDMY(endDate) : null,
    );

    /// Dynamic search, so that anyone can use SelectDates filter
    /// positioned anywhere in the list.
    currenState.categories!.forEach(
      (element) {
        final Filter? filter = element.category.filters.firstOrNull(
          (filter) => filter is SelectDates,
          orElse: () => null,
        );

        if (filter != null) {
          Filter? newFilter;

          /// When one date is selected the other one can be null
          if (startDate != null) {
            newFilter = (filter as SelectDates).copyWith(
              startDate: startDate,
            );
          }

          if (endDate != null) {
            newFilter = (filter as SelectDates).copyWith(
              endDate: endDate,
            );
          }
          changeFilterState(element, newFilter!);
        }
      },
    );
  }

  void displayDatePickerIfAvailable() {
    final currentState = state as SheetMultiFilters;

    currentState.categories!.forEach((element) {
      final filter = element.category.filters.firstOrNull(
        (filter) => filter is SelectDates && filter.selectionState,
        orElse: () => null,
      );
      if (filter != null) {
        state = currentState.copyWith(
          displayDateFilter: true,
        );
      }
    });
  }

  void choosePaymentMethod(LoanPaymentMethod paymentMethod,String amount) {
    final currentState = state as LoanRepaymentBottomSheet;
    currentState.loanRepayment.loanPaymentList.forEach((element) {
      if (element == paymentMethod) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });

    if (paymentMethod.amount.isNotEmpty) {
      currentState.loanRepayment.isAmountSelected = true;
      currentState.loanRepayment.onSelectedAmount(paymentMethod.amount);
      currentState.loanRepayment.onSelectedLabel(paymentMethod.name);
    } else {
      currentState.loanRepayment.isAmountSelected = false;
      currentState.loanRepayment.isPayNowSelected = true;
    }
    currentState.loanRepayment.selectedAmount = paymentMethod.amount;
    state = currentState.copyWith(
      loanRepayment: currentState.loanRepayment,
    );
  }

  void checkAmount(String amount,) {
    final currentState = state as CustomAmountBottomSheet;
    double outstandingAmount = removeCharacter(currentState.outstandingAmount);
    double enterAmount = removeCharacter(amount);
    if (outstandingAmount > enterAmount) {
      currentState.enteredAmount(amount);
      state = currentState.copyWith(
        isAmountValidated: true,
        showError: false
      );
    }else{
      state = currentState.copyWith(
        isAmountValidated: false,
        showError: true
      );
    }
  }

  double removeCharacter(String amount) {
    return double.parse(
        amount.replaceAll(",", "").replaceAll("TZSHS", "").trim());
  }

}
