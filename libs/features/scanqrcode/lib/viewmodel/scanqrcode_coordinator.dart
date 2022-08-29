
import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
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

  Future<String> getAgentName() async {
    return _scanQRCodeUseCase.getAgentName();
  }


    void validateForm(String customerId, int deviceId, String imei1, String imei2) {
      state = ScanQRCodeState.deviceRegisterFormState(
          _validateForm(customerId, deviceId, imei1, imei2));
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

  Future deviceRegister(String customerId, int deviceId, String imei1,
      String imei2) async {
      await deviceRegisterAPI(customerId, deviceId, imei1, imei2);
  }


  Future deviceRegisterAPI(
      String customerId,
      int deviceId,
      String imei1,
      String imei2
      ) async {
    state = const ScanQRCodeState.loading();
    try {
      var response = await _scanQRCodeUseCase.deviceRegistrationAPI(
          customerId, deviceId, imei1, imei2, (p0) => null);
      if (response?.status == true) {
        state = const ScanQRCodeState.successState();
            print("status");
        // _navigationHandler.navigateToOtpScreen(
        //      mobileNumber, response!.data!.id!);
      } else {
        print(response?.message);
        state = const ScanQRCodeState.imei1Error("error");
      }
    }  catch (e) {
      state = const ScanQRCodeState.initialState();
      print(e.toString());
    }
  }
  }
