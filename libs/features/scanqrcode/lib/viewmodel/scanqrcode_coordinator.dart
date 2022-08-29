
import 'package:core/view/analytics_state_notifier.dart';
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
    state = ScanQRCodeState.ready(
        context: context,
        error: "",isLoading: false);
  }


  Future<String> getAgentName() async {
    return _scanQRCodeUseCase.getAgentName();
  }


    void validateForm(String customerId, int deviceId,  imei1, String imei2) {
      state = ScanQRCodeState.DetailsFormState(
          _validateForm(customerId, deviceId, imei1, imei2));
    }

  bool _validateForm(String customerId, int deviceId, String imei1, String imei2) {
    var isCustomerIdValid = customerId.isNotEmpty;
    var isDeviceIdValid = deviceId != 0;
    var isImei1Valid = imei1.isNotEmpty;
    var isImei2Valid = imei2.isNotEmpty;
    var isValid = isCustomerIdValid &&
        isDeviceIdValid &&
        isImei1Valid &&
        isImei2Valid ;
    return isValid;
  }

  }
