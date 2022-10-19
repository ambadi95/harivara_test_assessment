import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';
import 'package:widget_library/utils/app_utils.dart';

import '../navigation_handler/other_payment_navigation_handler.dart';
import '../state/otherpayment_state.dart';
import 'otherpayment_usecase.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import 'otherpayment_viewmodel.dart';

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

  Future<String> getCustomerID() async {
    return _otherPaymentUseCase.getCustomerId();
  }

  Future<String> getClientID() async {
    return _otherPaymentUseCase.getClientId();
  }

  Future<void> navigateToScanCodeScreen(int? deviceId) async {
    await _navigationHandler.navigateToScanQrCode(deviceId);
  }

  Future<void> makePayment(
    BuildContext context,
    String amountToBePaid,
    String mobileNumber,
    String transactionId,
      int deviceId,
      String modelName, OtherPaymentScreenArgs otherPaymentScreenArgs
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
      _navigationHandler.navigateOfflinePaymentScreen(deviceId, modelName,otherPaymentScreenArgs);
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


  Future<String> getLoanCalled() async {
    return await _otherPaymentUseCase.getLoanCalled();
  }

  bool isValidTransID(String tranID) {
    bool result = _otherPaymentUseCase.isValidTranID(tranID);
    if (!result) {
      state = const OtherPaymentState.transIDError('other_down_trans_error');
    } else {
      state = const OtherPaymentState.transIDError('');
    }
    return result;
  }

 bool isValidMobileNumber(String mobileNumber) {
    bool result = _otherPaymentUseCase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state = const OtherPaymentState.mobileNumberError('LS_mobile_error_text');
    } else {
      state = const OtherPaymentState.mobileNumberError('');
    }
    return result;
  }

  void validateForm(String tranID, String mobNumber) {
    state = OtherPaymentState.OtherPaymentFormState(
        _validateForm(tranID, mobNumber, ));
  }

  bool _validateForm(String tranID, String mobNumber) {
    var isTranIDValid = _otherPaymentUseCase.isValidTranID(tranID);
    var ismobileNoValid = _otherPaymentUseCase.isValidMobileNumber(mobNumber);
    var isValid = isTranIDValid &&
        ismobileNoValid;
      return isValid;
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
