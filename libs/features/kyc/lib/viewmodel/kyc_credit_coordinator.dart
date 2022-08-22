import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';

import '../navigation_handler/kyc_credit_navigation_handler.dart';
import '../state/kyc_credit_state.dart';
import 'kyc_credit_usecase.dart';

class KycCreditCoordinator extends AnalyticsStateNotifier<KycCreditState> {
  final KycCreditNavigationHandler _navigationHandler;
  final KycCreditUseCase _kycCreditUseCase;

  KycCreditCoordinator(
      this._navigationHandler,
      this._kycCreditUseCase,
      ) : super(const KycCreditState.initialState());

  void initialiseState(
      BuildContext context,

      ) async {
    state = KycCreditState.ready(
        context: context,
        error: "",isLoading: false);
  }

  Future<void> showErrorBottomSheet(Widget errorWidget, BuildContext context) async {
    await _navigationHandler.showErrorBottomSheet(errorWidget,context);
  }
  void goBack() async {
    _navigationHandler.goBack();
  }


 
}
