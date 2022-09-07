import 'dart:developer';

import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

import '../../../navigation_handler/device_option_navigation_handler.dart';
import '../state/device_detail_state.dart';
import 'device_detail_usecase.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';

class DeviceDetailCoordinator
    extends AnalyticsStateNotifier<DeviceDetailState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceDetailUseCase _DeviceOptionUseCase;
  final NavigationManager _navigationManager;

  DeviceDetailCoordinator(this._navigationHandler,
      this._DeviceOptionUseCase,
      this._navigationManager,) : super(const DeviceDetailState());

  Future getDeviceDetail(int deviceId) async {
    var response =
    await _DeviceOptionUseCase.getDeviceDetail(deviceId, (p0) => null);
    print(response);
    if (response!.status == true) {
      return response.data;
    }
  }

  Future<void> navigateToEnrolledScreen(int deviceId, UserType userType) async {
    try {
      var response =
      await _DeviceOptionUseCase.selectDevice(deviceId, (p0) => null);
      if (response?.status == true) {
        await _navigationHandler.navigateToCustomerEnrollmentScreen(
            '', userType);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> navigateToCustomerLoanCreationScreen(String image,
      Data deviceDetailData) async {
    await _navigationHandler.navigateToDeviceLoanCreation(
        image, deviceDetailData);
  }

  void navigateToDownPayment(String amount, int? deviceId) async {
    await _navigationHandler.navigateToDownPaymentScreen(amount, deviceId!);
  }
}





