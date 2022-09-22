import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';

import '../navigation_handler/down_payment_navigation_handler.dart';
import '../state/downpayment_state.dart';
import 'downpayment_usecase.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

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

  Future<String> getNewCustomerName() async {
    return _downPaymentUseCase.getNewCustomerName();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId, String modelName) async {
    await _navigationHandler.navigateToScanQrCode(deviceId, modelName);
  }

  Future<void> createLoan(BuildContext context) async {
    String deviceId = await _downPaymentUseCase.getDeviceId();

    String loanCalled = await getLoanCalled();

    if (loanCalled == "loanCalled") {
      return;
    }
    await _downPaymentUseCase.loanCalled("loanCalled");

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        loanActivated: 0,
        paymentRequested: 1,
        waitForPayment: 1,
        createLoan: 1,
        loanApproved: 0,
        paymentReceived: 1);
    var createLoan =
        await _downPaymentUseCase.createLoan(deviceId, (p0) => null);
    if (createLoan?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          createLoan: 1,
          loanApproved: 0,
          paymentReceived: 1);

      await loanApproval(createLoan!.data!.loanId!.toString(), context);
    } else {
      print("Failed");
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          createLoan: 2,
          paymentRequested: 1,
          waitForPayment: 1,
          loanApproved: 0,
          paymentReceived: 1);

      _showAlertForErrorMessage(createLoan!.message!, false);
    }
  }

  Future<void> loanApproval(String loanId, BuildContext context) async {
    String deviceId = await _downPaymentUseCase.getDeviceId();

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        loanActivated: 0,
        paymentRequested: 1,
        waitForPayment: 1,
        createLoan: 1,
        loanApproved: 0,
        paymentReceived: 1);
    var loanApprovalResponse =
        await _downPaymentUseCase.loanApproval(deviceId, loanId, (p0) => null);
    if (loanApprovalResponse?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          createLoan: 1,
          loanApproved: 1,
          paymentReceived: 1);
    } else {
      print("Failed");
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          createLoan: 1,
          paymentRequested: 1,
          waitForPayment: 1,
          loanApproved: 2,
          paymentReceived: 1);
      _showAlertForErrorMessage(loanApprovalResponse!.message!, true);
    }
  }

  Future<void> makePayment(BuildContext context, String amount) async {
    await _downPaymentUseCase.loanCalled("");
    await _downPaymentUseCase.setPaymentFailed("");

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        loanActivated: 0,
        paymentRequested: 0,
        waitForPayment: 0,
        createLoan: 0,
        loanApproved: 0,
        paymentReceived: 0);
    var mkePayment =
        await _downPaymentUseCase.makePayment(amount, (p0) => null);
    if (mkePayment?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          loanApproved: 0,
          createLoan: 0,
          paymentReceived: 0);

      await _downPaymentUseCase.setPaymentId(mkePayment!.data!.id.toString());

      checkPaymentStatus(context);
    } else {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 2,
          waitForPayment: 0,
          loanApproved: 0,
          createLoan: 0,
          paymentReceived: 0);
      _showAlertForErrorMessage(mkePayment!.message!, false,isPaymentError: true);

      print("Failed");
    }
  }

  Future<String> getLoanCalled() async {
    return await _downPaymentUseCase.getLoanCalled();
  }

  Future<void> checkPaymentStatus(
    BuildContext context,
  ) async {
    String paymentFailed = await _downPaymentUseCase.getPaymentFailed();
    String paymentId = await _downPaymentUseCase.getPaymentID();
    String loanCalled = await getLoanCalled();

    if (paymentFailed == "Payment Failed") {
      return;
    }
    if (loanCalled == "loanCalled") {
      return;
    }

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        loanActivated: 0,
        paymentRequested: 1,
        waitForPayment: 1,
        loanApproved: 0,
        createLoan: 0,
        paymentReceived: 0);

    var mkePayment =
        await _downPaymentUseCase.checkPaymentStatus(paymentId, (p0) => null);

    if (mkePayment?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: "",
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          loanApproved: 0,
          createLoan: mkePayment!.data!.status == "Downpayment_Success" ? 1 : 0,
          paymentReceived: mkePayment.data != null
              ? mkePayment.data!.status == "Downpayment_Success"
                  ? 1
                  : mkePayment.data!.status == "Downpayment_Initiated"
                      ? 0
                      : 2
              : 2);

      if (mkePayment.data!.status == "Downpayment_Failed") {
        await _downPaymentUseCase.setPaymentFailed("Payment Failed");
        _showAlertForErrorMessage(mkePayment.message!, false,isPaymentError: true);
      }
      if (mkePayment.data!.status == "Downpayment_Success") {
        createLoan(context);
      }
    } else {
      await _downPaymentUseCase.setPaymentFailed("Payment Failed");

      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanActivated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          createLoan: 0,
          loanApproved: 0,
          paymentReceived: 2);

      _showAlertForErrorMessage(mkePayment!.message!, false,isPaymentError: true);
    }
  }

  void setData(
      BuildContext context, DownPaymentScreenArgs downPaymentScreenArgs) async {
    await _downPaymentUseCase
        .setDeviceId(downPaymentScreenArgs.deviceId.toString());

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        loanActivated: downPaymentScreenArgs.loanActivated,
        paymentRequested: downPaymentScreenArgs.paymentRequested,
        waitForPayment: downPaymentScreenArgs.waitForPayment,
        loanApproved: downPaymentScreenArgs.loanApproved,
        paymentReceived: downPaymentScreenArgs.paymentReceived);

    if (downPaymentScreenArgs.title == "WORK_FLOW") {
      if (downPaymentScreenArgs.paymentRequested == 1) {
        checkPaymentStatus(context);
      }else if (downPaymentScreenArgs.paymentReceived == 1) {
          createLoan(context);
      } else {
        makePayment(context, downPaymentScreenArgs.amount);
      }
    } else {
      makePayment(context, downPaymentScreenArgs.amount);
    }
  }

  _showAlertForErrorMessage(String errorMessage, bool isLoanCreationTitle,{bool? isPaymentError = false} ) {

    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: isPaymentError == true ? 'Error' : isLoanCreationTitle ? 'Offline_loan_approval_error_msg'.tr : 'Offline_loan_creation_error_msg'.tr,
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
