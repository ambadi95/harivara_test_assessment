import 'package:payments/sub_features/payment_status/view_model/payment_status_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';

import '../../../navigation_handler/payments_navigation_handler.dart';
import '../state/payment_status_state.dart';

class PaymentStatusCoordinator extends BaseViewModel<PaymentStatusState> {
  PaymentStatusUseCase _paymentStatusUseCase;
  PaymentsNavigationHandler _navigationHandler;

  PaymentStatusCoordinator(
    this._navigationHandler,
    this._paymentStatusUseCase,
  ) : super(const PaymentStatusState.paymentStatusTimerState(
            timer: "", amount: ""));

  Future paymentCheckStatus(String paymentId,String timer) async {
    var response =
        await _paymentStatusUseCase.checkPaymentStatus(paymentId, (p0) => null);
    if (response?.status == true) {
      if(response?.data!=null && response?.data!.status=="Repayment_Success") {
        _navigationHandler.navigateToPaymentSuccess(
            amount: response?.data?.amountPaid,
            paymentId: response?.data?.paymentId);
      }else if(response?.data!=null && response?.data!.status=="Repayment_Failed"){
        navigateToPaymentFailure();
        return 0;
      }
    } else {
      if(timer==0) {
        navigateToPaymentFailure();
        return 0;
      }
    }
  }

  void navigateToPaymentFailure() async {
    await _navigationHandler.navigateToPaymentFailureBottomSheet();
  }

  navigateToHome() {
    _navigationHandler.navigateToHomeScreen();
  }
}
