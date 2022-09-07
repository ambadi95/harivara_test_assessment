import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/filter_date_button_options.dart';
import 'package:core/sheets/data_model/multi_selection_category.dart';
import 'package:core/sheets/data_model/progress_indicator_options.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

import '../data_model/loan_repayment.dart';

part 'crayon_payment_bottom_sheet_state.freezed.dart';

@freezed
class CrayonPaymentBottomSheetState with _$CrayonPaymentBottomSheetState {
  const CrayonPaymentBottomSheetState._();

  const factory CrayonPaymentBottomSheetState.infoState({
    required CrayonPaymentBottomSheetIcon bottomSheetIcon,
    @Default(true) bool isSvg,
    String? title,
    String? subtitle,
    List<String>? additionalText,
    List<ButtonOptions>? buttonOptions,
    Duration? autoCloseAfter,
    @Default(false) bool disableCloseButton,
  }) = SheetInfo;

  const factory CrayonPaymentBottomSheetState.infoStateWrap({
    required CrayonPaymentBottomSheetIcon bottomSheetIcon,
    String? title,
    String? subtitle,
    List<ButtonOptions>? buttonOptions,
    Duration? autoCloseAfter,
    bool? hasCloseButton,
    Function? onClose,
  }) = SheetInfoWrap;

  const factory CrayonPaymentBottomSheetState.selectionState({
    List<FilterDateButtonOptions>? buttonOptions,
    Future<dynamic> Function()? callback,
  }) = SheetSelection;

  const factory CrayonPaymentBottomSheetState.waitingState({
    required Future<CrayonPaymentBottomSheetState?> Function()?
        immediateCallback,
    String? waitingText,
    @Default(false) bool disableIcon,
    @Default(false) bool disableCloseButton,
    @Default(ProgressIndicatorOptions())
        ProgressIndicatorOptions progressIndicatorOptions,
  }) = SheetWaiting;

  const factory CrayonPaymentBottomSheetState.simpleWatingState({
    String? waitingText,
  }) = SheetSimpleWaiting;

  const factory CrayonPaymentBottomSheetState.multipleSelection({
    required String title,
    required List<ButtonOptions> options,
  }) = SheetMultipleSelection;

  const factory CrayonPaymentBottomSheetState.datePickerState({
    DateTime? startDate,
    DateTime? endDate,
    Future<dynamic> Function(dynamic, dynamic)? callbackAfterDateIsSelected,
  }) = SheetDatePicker;

  const factory CrayonPaymentBottomSheetState.multiFilterState({
    String? title,
    List<MultiSelectionCategory>? categories,
    MultiSelectionButton? leftActionButton,
    MultiSelectionButton? rightActionButton,

    /// Don't touch the following params when passing the state
    /// used in business logic to display a datePicker when SelectDates filter
    /// is available
    /// [displayDateFilter]
    @Default(false) bool displayDateFilter,
    String? startDate,
    String? endDate,
  }) = SheetMultiFilters;

  const factory CrayonPaymentBottomSheetState.closeSheet({
    Future<dynamic> Function()? callbackBeforeClosingSheet,
    Future<dynamic> Function()? callbackAfterClosingSheet,
  }) = CloseBottomSheet;

  const factory CrayonPaymentBottomSheetState.agentEnrollment({
    required CrayonPaymentBottomSheetIcon bottomSheetIcon,
    String? title,
    String? subtitle,
    List<String>? additionalText,
    List<ButtonOptions>? buttonOptions,
    Duration? autoCloseAfter,
    @Default(false) bool disableCloseButton,
  }) = AgentEnrollmentSheet;

  const factory CrayonPaymentBottomSheetState.changeLanguage({
    required CrayonPaymentBottomSheetIcon bottomSheetIcon,
    String? title,
    String? subtitle,
    List<String>? additionalText,
    List<Widget>? widgetOptions,
    List<ButtonOptions>? buttonOptions,
    Duration? autoCloseAfter,
    @Default(false) bool disableCloseButton,
  }) = ChangeLanguageBottomSheet;

  const factory CrayonPaymentBottomSheetState.loanRepayment({
    required LoanRepayment loanRepayment,
  }) = LoanRepaymentBottomSheet;

  const factory CrayonPaymentBottomSheetState.customAmount({
    required String? title,
    required String outstandingAmount,
    required Function(String) enteredAmount,
    List<ButtonOptions>? buttonOptions,
    @Default(false) bool isAmountValidated,
    required Function(String) onSelectedLabel,

  }) = CustomAmountBottomSheet;


}
