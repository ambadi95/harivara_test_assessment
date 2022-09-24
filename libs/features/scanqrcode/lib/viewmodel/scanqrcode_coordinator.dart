
import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_usecase.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import '../navigation_handler/scanqrcode_navigation_handler.dart';
import '../state/scanqrcode_state.dart';
import 'package:get/get.dart';


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

  Future<String> getNewCustomerName() async {
    return _scanQRCodeUseCase.getNewCustomerName();
  }

  Future<String> getCustomerID() async {
    return _scanQRCodeUseCase.getCustomerId();
  }

  Future<String> getDeviceID() async {
    return _scanQRCodeUseCase.getDeviceId();
  }

  Future<String> getModelName() async {
    return _scanQRCodeUseCase.getModelName();
  }


void successFulScreen(){
  _navigationHandler.navigateToSuccessScreen();
}

  void configureMdmScreen(String imei1, String imei2){
    _navigationHandler.navigateToConfigureMdmScreen(imei1, imei2);
  }

  void goBackToAgentHomeScreen(){
    _navigationHandler.navigateToAgentHome();
  }



  void validateForm(String customerId, int deviceId, String imei1, String imei2) {
      state = ScanQRCodeState.deviceRegisterFormState(
          _validateForm(customerId, deviceId, imei1, imei2));
    }


  Future<String> scanBarcodeImei1() async {
    String barcodeScanRes = "";
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (kDebugMode) {
        print(barcodeScanRes);
      }

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if(barcodeScanRes == '-1'){
      return '';
    }else {
      return barcodeScanRes;
    }
  }

  Future<String> scanBarcodeImei2() async {
    String barcodeScanRes="";
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (kDebugMode) {
        print('^^^^^^^^^^^^^^^');
        print(barcodeScanRes);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }if(barcodeScanRes == '-1'){
      return '';
    }else {
      return barcodeScanRes;
    }
  }



  bool _validateForm(String customerId, int deviceId, String imei1, String imei2) {
    var isCustomerIdValid = customerId.isNotEmpty;
    var isDeviceIdValid = deviceId != 0;
    var isImei1Valid = imei1.length == 15;
    var isImei2Valid = imei2.length == 15;
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

  Future deviceRegister(BuildContext context, int deviceId, String imei1,
      String imei2, String modelName) async {

      await deviceRegisterAPI(context, deviceId , imei1, imei2, modelName);
  }


  Future deviceRegisterAPI(
      BuildContext context,
       int deviceId,
      String imei1,
      String imei2,
      String modelName
      ) async {
    String model = await getModelName();
    print("model name from preference====> $model");
    state = ScanQRCodeState.ready(context: context,isLoading:true);
    var response = await _scanQRCodeUseCase.deviceRegistrationAPI(deviceId, imei1, imei2, (p0) => null);
    if (response?.status == true) {
    state = ScanQRCodeState.ready(context: context,isLoading:false );
      if(response?.message == "Device registration success"){
        showAlertForSuccessMessage(imei1, imei2, model, context);
        //configureMdmScreen(imei1, imei2);
        //successFulScreen();
      }
    } else {
    state = ScanQRCodeState.ready(context: context,isLoading:false,error: response!.message!);
    _showAlertForErrorMessage(response.message!);
    if (kDebugMode) {
      print(response.message);
    }
    }
  }

  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

  Future<void> showAlertForSuccessMessage(
      String imei1, String imei2, String modelName, BuildContext context) async {
    await _navigationHandler.showSuccessBottomSheet(imei1, imei2, modelName, context);
  }


  void goBack() async {
    _navigationHandler.goBack();
  }
}
