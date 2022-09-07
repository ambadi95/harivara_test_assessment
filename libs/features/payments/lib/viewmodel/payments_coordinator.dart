import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payments/state/payments_state.dart';
import 'package:payments/viewmodel/payments_usecase.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../navigation_handler/payments_navigation_handler.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';

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

  Future<void> goBack() async {
    _navigationHandler.goBack();
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
    BuildContext context,
  ) async {
    try {
      state = PaymentsState.ready(context: context, error: "", isLoading: true);
      var response = await _downPaymentUseCase.hitPaymentApi(
        amount,
        paymentType,
        (p0) => null,
      );
      if (response?.status == true) {
        state =
            PaymentsState.ready(context: context, error: "", isLoading: false);
        navigateToPaymentSuccessBottomSheet();
        if (kDebugMode) {
          print(response?.message);
        }
      } else {
        state =
            PaymentsState.ready(context: context, error: "", isLoading: false);
        if (kDebugMode) {
          print(response?.message);
        }
      }
    } catch (e) {
      print(e.toString());
      state =
          PaymentsState.ready(context: context, error: "", isLoading: false);
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }
}
