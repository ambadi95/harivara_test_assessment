import 'dart:developer';

import 'package:config/Config.dart';
import 'package:core/view/analytics_state_notifier.dart';

import '../../../navigation_handler/device_option_navigation_handler.dart';
import '../state/device_detail_state.dart';
import 'device_detail_usecase.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';

class DeviceDetailCoordinator
    extends AnalyticsStateNotifier<DeviceDetailState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceDetailUseCase _DeviceOptionUseCase;

  DeviceDetailCoordinator(
    this._navigationHandler,
    this._DeviceOptionUseCase,
  ) : super(const DeviceDetailState());

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
        await _navigationHandler.navigateToCustomerEnrollmentScreen('', userType);
      }
    }  catch (e) {
      print(e.toString());
    }
  }

  Future<void> navigateToCustomerLoanCreationScreen(
      String image, Data deviceDetailData) async {
    await _navigationHandler.navigateToDeviceLoanCreation(
        image, deviceDetailData);
  }
}
