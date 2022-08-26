import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loan_details/state/loan_detail_state.dart';
import '../navigation_handler/loan_detail_navigation_handler.dart';

import 'loan_detail_usecase.dart';

class LoanDetailCoordinator extends AnalyticsStateNotifier<LoanDetailState> {
  final LoanDetailNavigationHandler _navigationHandler;
  final LoanDetailUseCase _kycCreditUseCase;

  LoanDetailCoordinator(
    this._navigationHandler,
    this._kycCreditUseCase,
  ) : super(const LoanDetailState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        LoanDetailState.ready(context: context, error: "", isLoading: false);
  }

  Future<void> showErrorBottomSheet(
      Widget errorWidget, BuildContext context) async {
    // await _navigationHandler.showErrorBottomSheet(errorWidget,context);
  }

  Future<void> navigateToTermsCondtionsScreen() async {
    await _navigationHandler.navigateToTermsCondtionsScreen();
  }

  void goBack() async {
    _navigationHandler.goBack();
  }
}
