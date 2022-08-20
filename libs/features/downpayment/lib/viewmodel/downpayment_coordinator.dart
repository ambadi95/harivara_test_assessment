import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';

import '../navigation_handler/down_payment_navigation_handler.dart';
import '../state/downpayment_state.dart';
import 'downpayment_usecase.dart';

class DownPaymentCoordinator extends AnalyticsStateNotifier<DownPaymentState> {
  final DownPaymentNavigationHandler _navigationHandler;
  final DownPaymentUseCase _downPaymentUseCase;

  DownPaymentCoordinator(
      this._navigationHandler,
      this._downPaymentUseCase,
      ) : super(const DownPaymentState.initialState());

  void initialiseState(
      BuildContext context,

      ) async {
    state = DownPaymentState.ready(
        context: context,
        error: "",isLoading: false);
  }
 



 
}
