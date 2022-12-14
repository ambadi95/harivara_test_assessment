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
  DownPaymentCoordinator(this._navigationHandler,
      this._downPaymentUseCase,) : super(const DownPaymentState.initialState());

    DownPaymentScreenArgs? cordinatorDownPaymentScreenArgs;

  void initialiseState(BuildContext context,) async {
    state =
        DownPaymentState.ready(context: context, error: "", isLoading: false);
  }


  Future<String> getAgentName() async {
    return _downPaymentUseCase.getAgentName();
  }

  Future<String> getNewCustomerName() async {
    return _downPaymentUseCase.getNewCustomerName();
  }

  Future<String> getPaymentStatus() async {
    return _downPaymentUseCase.getPaymentCalledStatus();
  }

  Future<void> setPaymentStatusCalled() async {
    await _downPaymentUseCase.setPaymentStatusCalled('called');
  }

  Future<String> getTelcoPartner() async {
    return _downPaymentUseCase.getTelcoPartner();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId, String modelName) async {
    await _navigationHandler.navigateToScanQrCode(deviceId, modelName);
  }

  Future<void> pop() async {
    await _navigationHandler.pop();
  }

  Future<void> showErrorBottomSheet(
      Widget errorWidget, BuildContext context) async {
    await _navigationHandler.showErrorBottomSheet(errorWidget, context);


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
        loanCreated: 0,
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
          loanCreated: 1,
          paymentRequested: 1,
          waitForPayment: 1,
          createLoan: 1,
          loanApproved: 0,
          paymentReceived: 1);

      //stock available
      if(cordinatorDownPaymentScreenArgs!.isOutOfStock==false){
        await loanApproval(createLoan!.data!.loanId!.toString(), context);
      }
    } else {
      print("Failed");
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanCreated: 2,
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
        loanCreated: 0,
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
          loanCreated: 0,
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
          loanCreated: 0,
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
        loanCreated: 0,
        paymentRequested: 0,
        waitForPayment: 0,
        createLoan: 0,
        loanApproved: 0,
        paymentReceived: 0);
    String telcoPartner = await getTelcoPartner();
    var mkePayment;
    switch(telcoPartner){
      case 'Airtel' : mkePayment =
      await _downPaymentUseCase.makePayment(amount, (p0) => null);
      break;
      case 'Vodacom' : mkePayment =
      await _downPaymentUseCase.makePaymentMpesa(amount, (p0) => null);
      break;
      default : _downPaymentUseCase.makePayment(amount, (p0) => null);
    }
    // var mkePayment =
    //     await _downPaymentUseCase.makePayment(amount, (p0) => null);
    if (mkePayment?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanCreated: 0,
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
          loanCreated: 0,
          paymentRequested: 2,
          waitForPayment: 0,
          loanApproved: 0,
          createLoan: 0,
          paymentReceived: 0);
      _showAlertForErrorMessage(
          mkePayment!.message!, false, isPaymentError: true);

      print("Failed");
    }
  }

  Future<String> getLoanCalled() async {
    return await _downPaymentUseCase.getLoanCalled();
  }


  Future<String> checkPaymentFailed() async {
    String paymentFailed = await _downPaymentUseCase.getPaymentFailed();
    return paymentFailed;
  }

  Future<void> checkPaymentStatus(BuildContext context,) async {
    String paymentFailed = await _downPaymentUseCase.getPaymentFailed();
    String paymentId = await _downPaymentUseCase.getPaymentID();
    String paymentStatus = await _downPaymentUseCase.getPaymentCalledStatus();
    String loanCalled = await getLoanCalled();

    if (paymentFailed == "Payment Failed") {
      return;
    }
    if(paymentStatus=="called"){
      return;
    }


    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        loanCreated: 0,
        paymentRequested: 1,
        waitForPayment: 1,
        loanApproved: 0,
        createLoan: 0,
        paymentReceived: 0);

    setPaymentStatusCalled();


    String telcoPartner = await getTelcoPartner();
    var mkePayment;
    switch(telcoPartner){
      case 'Airtel' : mkePayment =
      await _downPaymentUseCase.checkPaymentStatus(paymentId, (p0) => null);
      break;
      case 'Vodacom' : mkePayment =
      await _downPaymentUseCase.checkPaymentStatusMpesa(paymentId, (p0) => null);
      break;
      default : _downPaymentUseCase.checkPaymentStatus(paymentId, (p0) => null);
    }

    // var mkePayment =
    //     await _downPaymentUseCase.checkPaymentStatus(paymentId, (p0) => null);

    if (mkePayment?.status == true) {
      state = DownPaymentState.ready(
          context: context,
          error: "",
          isLoading: false,
          loanCreated: 0,
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

      if (mkePayment.data!.status == "Downpayment_Initiated") {
        await _downPaymentUseCase.setPaymentStatusCalled('');
      }else if (mkePayment.data!.status == "Downpayment_Failed") {
        await _downPaymentUseCase.setPaymentStatusCalled('called');
        await _downPaymentUseCase.setPaymentFailed("Payment Failed");
        _navigationHandler.navigateToPaymentFailureBottomSheet();
      }else if (mkePayment.data!.status == "Downpayment_Success") {
        await _downPaymentUseCase.setPaymentFailed("Payment Success");
        await _downPaymentUseCase.setPaymentStatusCalled('called');
        createLoan(context);
      }
    } else {
      await _downPaymentUseCase.setPaymentFailed("Payment Failed");

      state = DownPaymentState.ready(
          context: context,
          error: '',
          isLoading: false,
          loanCreated: 0,
          paymentRequested: 1,
          waitForPayment: 1,
          createLoan: 0,
          loanApproved: 0,
          paymentReceived: 2);

      // _showAlertForErrorMessage(
      //     mkePayment!.message!, false, isPaymentError: true);

      _navigationHandler.navigateToPaymentFailureBottomSheet();

    }
  }

  void setData(BuildContext context,
      DownPaymentScreenArgs downPaymentScreenArgs) async {
    cordinatorDownPaymentScreenArgs=downPaymentScreenArgs;
    await _downPaymentUseCase
        .setDeviceId(downPaymentScreenArgs.deviceId.toString());
    await _downPaymentUseCase.setPaymentStatusCalled('');

    state = DownPaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        loanCreated: downPaymentScreenArgs.loanCreated,
        paymentRequested: downPaymentScreenArgs.paymentRequested,
        waitForPayment: downPaymentScreenArgs.waitForPayment,
        loanApproved: downPaymentScreenArgs.loanApproved,
        paymentReceived: downPaymentScreenArgs.paymentReceived);


    if (downPaymentScreenArgs.subTitle.isEmpty == true) {
      if (downPaymentScreenArgs.title == "WORK_FLOW") {
        if (downPaymentScreenArgs.paymentRequested == 1) {
          checkPaymentStatus(context);
        } else if (downPaymentScreenArgs.paymentReceived == 1) {
          createLoan(context);
        } else {
          makePayment(context, downPaymentScreenArgs.amount);
        }
      } else {
        makePayment(context, downPaymentScreenArgs.amount);
      }
    } else {
      if(downPaymentScreenArgs.loanApproved == 2){
        state = DownPaymentState.ready(
            context: context,
            error: '',
            isLoading: false,
            loanCreated: 0,
            createLoan: 1,
            paymentRequested: 1,
            waitForPayment: 1,
            loanApproved: 2,
            paymentReceived: 1);
        _showAlertForErrorMessage("Loan Rejected", true);
      }else {

        state = DownPaymentState.ready(
            context: context,
            error: '',
            isLoading: false,
            loanCreated: 1,
            createLoan: 1,
            paymentRequested: 1,
            waitForPayment: 1,
            loanApproved: 0,
            paymentReceived: 1);
        // await loanApproval(downPaymentScreenArgs.subTitle, context);
      }
    }
  }




  _showAlertForErrorMessage(String errorMessage, bool isLoanCreationTitle,{bool? isPaymentError = false} ) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: 'PF_desc'.tr,
          //alertMessage: errorMessage,
          alertTitle: isPaymentError == true ? 'Error' : isLoanCreationTitle ? 'Offline_loan_approval_error_msg'.tr : 'Offline_loan_creation_error_msg'.tr,
          alertIcon: "assets/images/alert_icon.png",
          // onClose: () {
          //   _navigationHandler.goBack();
          // },
          additionalText: 'PF_customer_support'.tr,
          bottomButtonText: isPaymentError == true ? 'PF_back_to_payment'.tr :'Back_To_Home'.tr,
          onBottomButtonPress: (){
            if(isPaymentError == true){
              _navigationHandler.goBack();
             _navigationHandler.navigateToDeviceLoanCreation();
            }else{
              _navigationHandler.goBack();
            }

          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }


  navigatetoSuccessScreen() async {
    await _navigationHandler.navigateToFinalSuccess();
  }

  void goHomeScreen() {
    _navigationHandler.goBack();
  }
  void goBack() {
    _navigationHandler.pop();
  }
}
