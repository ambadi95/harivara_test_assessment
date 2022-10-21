import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/navigation/crayon_payment_bottom_sheet_route_manager.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_app_language.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_apply_filter.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_custom_amount.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_date_picker_column.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_info_column_wrapped.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_loan_repayment.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_multi_filters.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_multiple_selection_options.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_selection_column.dart';
import 'package:core/sheets/view/widgets/bottom_sheet_simple_waiting_column.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';

import '../navigation/crayon_payment_bottom_sheet_route_manager.dart';
import 'widgets/bottom_sheet_agent_enrollment_sucess.dart';
import 'widgets/bottom_sheet_info_column.dart';
import 'widgets/bottom_sheet_waiting_column.dart';

class CrayonPaymentBottomSheet extends StatelessWidget {
  static const String viewPath =
      '${CrayonPaymentBottomSheetRouteManager.moduleIdentifier}/crayonPaymentBottomSheet';
  final CrayonPaymentBottomSheetState _bottomSheetState;

  const CrayonPaymentBottomSheet(this._bottomSheetState, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<
          CrayonPaymentBottomSheetCoordinator, CrayonPaymentBottomSheetState>(
        setupViewModel: (coordinator) =>
            coordinator.setUpState(_bottomSheetState),
        builder: (context, state, coordinator) =>
            _buildMainUi(coordinator, state),
      );

  Container _buildMainUi(
    CrayonPaymentBottomSheetCoordinator coordinator,
    CrayonPaymentBottomSheetState state,
  ) {
    EdgeInsets padding = state.maybeWhen(
      orElse: () => EdgeInsets.all(20),
      multipleSelection: (_, __) => EdgeInsets.only(top: 20),
    );

    return Container(
      padding: padding,
      key: const Key('bottomSheet'),
      decoration: _buildBoxDecoration,
      child: state.maybeWhen(
        infoState: (_,isSvg, __, ___, additionalText, ____, _____, ______) =>
            BottomSheetInfoColumn(
          coordinator,
          state as SheetInfo,
        ),
        infoStateWrap: (_, __, ___, ____, _____, ______, _______) =>
            BottomSheetInfoColumnWrap(
          state as SheetInfoWrap,
          coordinator: coordinator,
        ),
        simpleWatingState: (text) =>
            BottomSheetSimpleWaitingColumn(coordinator, text),
        waitingState: (_, waitingText, __, ___, ____) =>
            BottomSheetWaitingColumn(
          coordinator,
          waitingText,
          state as SheetWaiting,
        ),
        selectionState: (_, __) => BottomSheetSelectionColumn(
          coordinator,
          state as SheetSelection,
        ),
        datePickerState: (_, __, ___) => BottomSheetDatePickerColumn(
          coordinator,
          state as SheetDatePicker,
        ),
        multiFilterState: (_, __, ___, ____, _____, ______, _______) =>
            BottomSheetMultiFilters(
          coordinator,
          state as SheetMultiFilters,
        ),
        multipleSelection: (title, options) {
          return BottomSheetMultipleSelectionOptions(
            options: options,
            title: title,
          );
        },
        agentEnrollment: (_, __, ___, additionalText, ____, _____, ______) =>
            BottomSheetAgentEnrollment(
          coordinator,
          state as AgentEnrollmentSheet,
        ),
        changeLanguage:
            (_, __, ___, additionalText, ____, _____, ______, ________) =>
                BottomSheetAppLanguage(
          coordinator,
          state as ChangeLanguageBottomSheet,
        ),
        referralApplyFiler:  (_, __, ___, additionalText, ____, _____, ______, ________) =>
            BottomSheetApplyFilter(
              coordinator,
              state as ApplyFilterBottomSheet,
            ),
        loanRepayment: (_) => BottomSheetLoanRepayment(
          coordinator,
          state as LoanRepaymentBottomSheet,
        ),
        customAmount: (_, __,___,____,_____,______,_______,________,_________) => BottomSheetCustomAmount(
            coordinator, state as CustomAmountBottomSheet),
        orElse: () => const Center(
          key: Key('ErrorBottomSheet'),
          child: Text('Error'),
        ),
      ),
    );
  }

  BoxDecoration get _buildBoxDecoration {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24.0),
        topLeft: Radius.circular(24.0),
      ),
    );
  }
}
