import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/offlinepayment/offlinepayment_screen_args.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../navigation_handler/offline_payment_navigation_handler.dart';
import '../state/offlinepayment_state.dart';
import 'offlinepayment_usecase.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

class OfflinePaymentCoordinator extends AnalyticsStateNotifier<OfflinePaymentState> {
  final OfflinePaymentNavigationHandler _navigationHandler;
  final OfflinePaymentUseCase _offlinePaymentUseCase;

  OfflinePaymentCoordinator(
    this._navigationHandler,
    this._offlinePaymentUseCase,
  ) : super(const OfflinePaymentState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        OfflinePaymentState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getAgentName() async {
    return _offlinePaymentUseCase.getAgentName();
  }

  Future<String> getNewCustomerName() async {
    return _offlinePaymentUseCase.getNewCustomerName();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId, String modelName) async {
    await _navigationHandler.navigateToScanQrCode(deviceId, modelName);
  }

  Future<void> showErrorBottomSheet(
      Widget errorWidget, BuildContext context) async {
    await _navigationHandler.showErrorBottomSheet(errorWidget, context);


  }

  Future<void> createLoan(BuildContext context, OfflinePaymentScreenArgs offlinePaymentScreenArgs) async {
    String deviceId = await _offlinePaymentUseCase.getDeviceId();

    state = OfflinePaymentState.ready(
        context: context,
        error: '',
        isLoading: true,
        paymentReceivedOffline: 1,
        loanApproved: 0,);
    try {
      var createLoan = await _offlinePaymentUseCase.createLoan(deviceId, (p0) => null);

    if (createLoan?.status == true) {
      dismissProgress(context);
      state = OfflinePaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        loanCreated: 1,
        paymentReceivedOffline: 1,
        loanApproved: 0,);
      if(offlinePaymentScreenArgs.isOutOfStock == false) {
        await loanApproval(createLoan!.data!.loanId!.toString(), context);
      }
    } else {
      dismissProgress(context);

      _showAlertForErrorMessage(createLoan!.message!, false);
    }
    }catch (e){

      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {Navigator.pop(context);},
      );
    }
  }

  void dismissProgress(BuildContext context){
    state = OfflinePaymentState.ready(
      context: context,
      error: '',
      isLoading: false,
      paymentReceivedOffline: 1,
      loanApproved: 2,
    );
  }

  Future<void> loanApproval(String loanId, BuildContext context) async {
    String deviceId = await _offlinePaymentUseCase.getDeviceId();

    state = OfflinePaymentState.ready(
      context: context,
      error: '',
      isLoading: true,
      paymentReceivedOffline: 1,
      loanApproved: 0,
    );
    var loanApprovalResponse =
        await _offlinePaymentUseCase.loanApproval(deviceId, loanId, (p0) => null);
    if (loanApprovalResponse?.status == true) {
      state = OfflinePaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,
        loanApproved: 1,
      );
    } else {
      print("Failed");
      state = OfflinePaymentState.ready(
        context: context,
        error: '',
        isLoading: false,
        paymentReceivedOffline: 1,

        loanApproved: 2,
      );
      _showAlertForErrorMessage(loanApprovalResponse!.message!, true);
    }
  }

  // Future<void> makePayment(BuildContext context, String amount) async {
  //
  //   state = OfflinePaymentState.ready(
  //     context: context,
  //     error: '',
  //     isLoading: false,
  //     paymentReceivedOffline: 1,
  //
  //     loanApproved: 0,
  //   );
  //   var mkePayment =
  //       await _offlinePaymentUseCase.makePayment(amount, (p0) => null);
  //   if (mkePayment?.status == true) {
  //     state = OfflinePaymentState.ready(
  //       context: context,
  //       error: '',
  //       isLoading: false,
  //       paymentReceivedOffline: 1,
  //
  //       loanApproved: 0,
  //     );
  //
  //
  //   } else {
  //     state = OfflinePaymentState.ready(
  //       context: context,
  //       error: '',
  //       isLoading: false,
  //       paymentReceivedOffline: 1,
  //
  //       loanApproved: 0,
  //     );
  //     _showAlertForErrorMessage(mkePayment!.message!);
  //
  //     print("Failed");
  //   }
  // }

  Future<String> getLoanCalled() async {
    return await _offlinePaymentUseCase.getLoanCalled();
  }

  _showAlertForErrorMessage(String errorMessage, bool isLoanCreationTitle) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: 'PF_desc'.tr,
          //alertMessage: errorMessage,
          alertTitle: isLoanCreationTitle ? 'Offline_loan_approval_error_msg'.tr : 'Offline_loan_creation_error_msg'.tr,
          alertIcon: "assets/images/alert_icon.png",
          // onClose: () {
          //   _navigationHandler.goBack();
          // },
          additionalText: 'PF_customer_support'.tr,
          bottomButtonText: 'Back_To_Home'.tr,
          onBottomButtonPress: (){
            _navigationHandler.goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }


  navigatetoSuccessScreen() async {
    print("out of stock flow");
    await _navigationHandler.navigateToOutStockFinalSuccess();
  }

  void goBack() async {
    await _navigationHandler.pop();
  }

  void goHomeScreen() {
    _navigationHandler.goBack();
  }}
