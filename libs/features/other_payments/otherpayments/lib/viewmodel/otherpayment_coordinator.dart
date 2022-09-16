import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:widget_library/utils/app_utils.dart';

import '../navigation_handler/other_payment_navigation_handler.dart';
import '../state/otherpayment_state.dart';
import 'otherpayment_usecase.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

class OtherPaymentCoordinator
    extends AnalyticsStateNotifier<OtherPaymentState> {
  final OtherPaymentNavigationHandler _navigationHandler;
  final OtherPaymentUseCase _otherPaymentUseCase;

  OtherPaymentCoordinator(
    this._navigationHandler,
    this._otherPaymentUseCase,
  ) : super(const OtherPaymentState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        OtherPaymentState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getAgentName() async {
    return _otherPaymentUseCase.getAgentName();
  }

  Future<String> getNewCustomerName() async {
    return _otherPaymentUseCase.getNewCustomerName();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId) async {
    await _navigationHandler.navigateToScanQrCode(deviceId);
  }

  Future<void> createLoan(
    BuildContext context,
    String amountToBePaid,
    String mobileNumber,
    String transactionId,
  ) async {
    state = OtherPaymentState.ready(
      context: context,
      error: '',
      isLoading: true,
      paymentReceivedOffline: 1,
      loanApproved: 0,
    );
    var createLoan = await _otherPaymentUseCase.createLoan(
      amountToBePaid,
      mobileNumber,
      transactionId,
      (p0) => null,
    );
    if (createLoan?.status == true) {
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 1,
      );

      //await loanApproval(createLoan!.data!.loanId!.toString(), context);
    } else {
      print("Failed");
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 0,
      );

      _showAlertForErrorMessage(createLoan!.message!);
    }
  }

  Future<void> loanApproval(String loanId, BuildContext context) async {
    String deviceId = await _otherPaymentUseCase.getDeviceId();

    state = OtherPaymentState.ready(
      context: context,
      error: '',
      isLoading: false,
      paymentReceivedOffline: 1,
      loanApproved: 0,
    );
    var loanApprovalResponse =
        await _otherPaymentUseCase.loanApproval(deviceId, loanId, (p0) => null);
    if (loanApprovalResponse?.status == true) {
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 0,
      );
    } else {
      print("Failed");
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 0,
      );
      _showAlertForErrorMessage(loanApprovalResponse!.message!);
    }
  }

  Future<void> makePayment(
    BuildContext context,
    String amountToBePaid,
    String mobileNumber,
    String transactionId,
  ) async {
    state = OtherPaymentState.ready(
      context: context,
      error: '',
      isLoading: false,
      paymentReceivedOffline: 1,
      loanApproved: 0,
    );
    AppUtils.appUtilsInstance.showCircularDialog(context);
    var mkePayment = await _otherPaymentUseCase.makePayment(
      amountToBePaid,
      mobileNumber,
      transactionId,
      (p0) => null,
    );
    if (mkePayment?.status == true) {
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 0,
      );
      Navigator.pop(context);
      _navigationHandler.navigateOfflinePaymentScreen();
    } else {
      state = OtherPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 0,
      );
      Navigator.pop(context);
      _showAlertForErrorMessage(mkePayment!.message!);

      print("Failed");
    }
  }

/*  bool isValidMobileNumber(String mobileNumber) {
    bool result = _otherPaymentUseCase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state = const OtherPaymentState.mobileNumberError('SU_subtitle_error_text');
    } else {
      state = const OtherPaymentState.mobileNumberError('');
    }
    return result;
  }*/
  Future<String> getLoanCalled() async {
    return await _otherPaymentUseCase.getLoanCalled();
  }

  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            _navigationHandler.goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }
}