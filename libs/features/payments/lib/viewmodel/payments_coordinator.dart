import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payments/state/payments_state.dart';
import 'package:payments/viewmodel/payments_usecase.dart';

import '../navigation_handler/payments_navigation_handler.dart';

class PaymentsCoordinator extends AnalyticsStateNotifier<PaymentsState> {
  final PaymentsNavigationHandler _navigationHandler;
  final PaymentsUseCase _downPaymentUseCase;

  PaymentsCoordinator(
    this._navigationHandler,
    this._downPaymentUseCase,
  ) : super(const PaymentsState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state = PaymentsState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getAgentName() async {
    return _downPaymentUseCase.getAgentName();
  }

  void navigateToPaymentSuccessBottomSheet() async {
    await _navigationHandler.navigateToPaymentSuccessfullBottomSheet();
  }

  Future paymentApi(
    String amount,
    String paymentType,
  ) async {
    try {
      var response = await _downPaymentUseCase.hitPaymentApi(
        amount,
        paymentType,
        (p0) => null,
      );
      if (response?.status == true) {
        state = const PaymentsState.initialState();
        if (kDebugMode) {
          print(response?.message);
        }
      } else {
        state = const PaymentsState.initialState();
        if (kDebugMode) {
          print(response?.message);
        }
      }
    }  catch (e) {

      print(e.toString());
    }
  }
}
