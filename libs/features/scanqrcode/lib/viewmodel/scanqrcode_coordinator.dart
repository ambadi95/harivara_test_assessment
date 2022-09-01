
import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_usecase.dart';
import '../navigation_handler/scanqrcode_navigation_handler.dart';
import '../state/scanqrcode_state.dart';


class ScanQRCodeCoordinator extends AnalyticsStateNotifier<ScanQRCodeState> {
  final ScanQRCodeNavigationHandler _navigationHandler;
  final ScanQRCodeUseCase _scanQRCodeUseCase;

  ScanQRCodeCoordinator(
    this._navigationHandler,
    this._scanQRCodeUseCase,
  ) : super(const ScanQRCodeState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        ScanQRCodeState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getCustomerName() async {
    return _scanQRCodeUseCase.getCustomerName();
  }

  Future<String> getCustomerID() async {
    return _scanQRCodeUseCase.getCustomerId();
  }

  Future<String> getDeviceID() async {
    return _scanQRCodeUseCase.getDeviceId();
  }


void successFulScreen(){
  _navigationHandler.navigateToSuccessScreen(UserType.Agent);
}

  void goBackToAgentHomeScreen(){
    _navigationHandler.navigateToAgentHome();
  }

  void validateForm(String customerId, int deviceId, String imei1, String imei2) {
      state = ScanQRCodeState.deviceRegisterFormState(
          _validateForm(customerId, deviceId, imei1, imei2));
    }

    Future<String> scanQRCodeImei1Method(){
      var result = _scanQRCodeUseCase.scanBarcodeImei1();
      return result;
    }

    Future<String> scanQRCodeImei2Method(){
      var result = _scanQRCodeUseCase.scanBarcodeImei2();
      return result;
    }

  bool _validateForm(String customerId, int deviceId, String imei1, String imei2) {
    var isCustomerIdValid = customerId.isNotEmpty;
    var isDeviceIdValid = deviceId != 0;
    var isImei1Valid = imei1.length.isNotEmptyOrNull;
    var isImei2Valid = imei2.length.isNotEmptyOrNull;
    var isValid = isCustomerIdValid &&
        isDeviceIdValid &&
        isImei1Valid &&
        isImei2Valid ;
    return isValid;
  }



  bool isImei1numberValid(String mobileNumber) {
    var result = _scanQRCodeUseCase.isValidIMEINumber(mobileNumber);
    if (!result) {
      state = const ScanQRCodeState.imei1Error('SU_valid_IMEI1');
    } else {
      state = const ScanQRCodeState.imei1Error('');
    }
    return result;
  }

  bool isImei2numberValid(String mobileNumber) {
    var result = _scanQRCodeUseCase.isValidIMEINumber(mobileNumber);
    if (!result) {
      state = const ScanQRCodeState.imei2Error('SU_valid_IMEI2');
    } else {
      state = const ScanQRCodeState.imei2Error('');
    }
    return result;
  }

  Future deviceRegister(int deviceId, String imei1,
      String imei2) async {
      await deviceRegisterAPI(deviceId, imei1, imei2);
  }


  Future deviceRegisterAPI(
      int deviceId,
      String imei1,
      String imei2
      ) async {
    state = const ScanQRCodeState.loading();
    try {
      var response = await _scanQRCodeUseCase.deviceRegistrationAPI(
         deviceId, imei1, imei2, (p0) => null);
      if (response?.status == true) {
        state = const ScanQRCodeState.successState();
         //String username = getAgentName();
        successFulScreen();
      } else {
        print("response?.message");
        state = const ScanQRCodeState.imei1Error("error");
      }
    } catch (e) {
      state = const ScanQRCodeState.initialState();
      print(e);
      // AppUtils.appUtilsInstance.showErrorBottomSheet(
      //   title: e.toString(),
      //   onClose: () {goBack();},
      // );
    }
  }
}
