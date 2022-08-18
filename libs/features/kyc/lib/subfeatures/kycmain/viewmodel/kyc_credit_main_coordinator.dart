import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';

import '../navigation_handler/kyc_main_navigation_handler.dart';
import '../state/kyc_credit_main_state.dart';
import 'kyc_credit_main_usecase.dart';

class KycCreditMainCoordinator
    extends AnalyticsStateNotifier<KycCreditMainState> {
  final KycCreditMainNavigationHandler _navigationHandler;
  final KycCreditMainUseCase _kycCreditMainUseCase;

  KycCreditMainCoordinator(
    this._navigationHandler,
    this._kycCreditMainUseCase,
  ) : super(
          const KycCreditMainState.initialState(),
        );

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        KycCreditMainState.ready(context: context, error: "", isLoading: false);
  }

  Future<void> navigateToKycCreditAirtel() async {
    await _navigationHandler.navigateToCreditCheck();
  }
}
