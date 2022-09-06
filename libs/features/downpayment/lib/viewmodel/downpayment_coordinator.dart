import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';

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
    state =
        DownPaymentState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getAgentName() async {
    return _downPaymentUseCase.getAgentName();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId) async {
    await _navigationHandler.navigateToScanQrCode(deviceId);
  }

  Future<void> createLoan(String deviceId) async {
    var createLoan = await _downPaymentUseCase.createLoan(deviceId, (p0) => null);
    if (createLoan?.status == true) {
      print("Success ${createLoan}");
    } else {
      print("Failed");
    }
  }

  Future<void> makePayment(BuildContext context, String amount) async {
    var mkePayment =
        await _downPaymentUseCase.makePayment(amount, (p0) => null);
    if (mkePayment?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 0,
          loanApproved: 0,
          paymentReceived: 0);

      await _downPaymentUseCase.setPaymentId(mkePayment!.data!.id.toString());

      checkPaymentStatus(context, mkePayment.data!.id.toString());
    } else {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 2,
          waitForPayment: 0,
          loanApproved: 0,
          paymentReceived: 0);

      print("Failed");
    }
  }

  Future<void> checkPaymentStatus(
      BuildContext context, String paymentId) async {
    var mkePayment =
        await _downPaymentUseCase.checkPaymentStatus(paymentId, (p0) => null);
    if (mkePayment?.status == true) {
      print("Success");

      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          loanApproved: 0,
          paymentReceived: 0);
    } else {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 2,
          loanApproved: 0,
          paymentReceived: 0);

      print("Failed");
    }
  }



  void setData(
      BuildContext context, DownPaymentScreenArgs downPaymentScreenArgs) {
    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        loanActivated: downPaymentScreenArgs.loanActivated,
        paymentRequested: downPaymentScreenArgs.paymentRequested,
        waitForPayment: downPaymentScreenArgs.waitForPayment,
        loanApproved: downPaymentScreenArgs.loanApproved,
        paymentReceived: downPaymentScreenArgs.paymentReceived);
  }
}
