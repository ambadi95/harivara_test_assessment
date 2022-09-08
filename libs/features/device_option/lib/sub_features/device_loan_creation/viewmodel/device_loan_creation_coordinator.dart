import 'package:core/view/analytics_state_notifier.dart';
import 'package:device_option/sub_features/device_loan_creation/state/device_loan_creation_state.dart';
import 'package:device_option/sub_features/device_loan_creation/viewmodel/device_loan_creation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

import '../../../navigation_handler/device_option_navigation_handler.dart';

class DeviceLoanCreationCoordinator
    extends AnalyticsStateNotifier<DeviceLoanCreationState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceLoanCreationUseCase _DeviceOptionUseCase;

  DeviceLoanCreationCoordinator(
    this._navigationHandler,
    this._DeviceOptionUseCase,
  ) : super(const DeviceLoanCreationState.initialState());

  void navigateToDownPayment(String amount,int? deviceId) async {
    await _navigationHandler.navigateToDownPaymentScreen(amount,deviceId!);
  }

  Future getLoanPreview(BuildContext context,int deviceId) async {
    state =
        DeviceLoanCreationState.ready(context: context, error: "", isLoading: true);
    var response =
    await _DeviceOptionUseCase.getLoanPreview(deviceId, (p0) => null);
    print(response);
    if (response!.status == true) {
      state =
          DeviceLoanCreationState.ready(context: context, error: "", isLoading: false);
      return response;

    }else{
      state =
          DeviceLoanCreationState.ready(context: context, error: "", isLoading: false);
      _showAlertForErrorMessage(response.message!);
    }
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
