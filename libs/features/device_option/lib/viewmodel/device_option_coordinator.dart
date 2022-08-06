import 'package:core/view/analytics_state_notifier.dart';

import '../navigation_handler/device_option_navigation_handler.dart';
import '../state/device_option_state.dart';
import 'device_option_usecase.dart';

class DeviceOptionCoordinator
    extends AnalyticsStateNotifier<DeviceOptionState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceOptionUseCase _DeviceOptionUseCase;

  DeviceOptionCoordinator(
    this._navigationHandler,
    this._DeviceOptionUseCase,
  ) : super(DeviceOptionState.initialState());

  void initialiseState(bool isMember, String destinationPath) async {
    state = DeviceOptionState.ready(
        destination: destinationPath, isMember: isMember);
  }

  Future fetchDeviceList(bool isMember, String destinationPath) async {
    var response = await _DeviceOptionUseCase.getDeviceList((p0) => null);
    if (response!.status == true) {
      state = DeviceOptionState.ready(
          isMember: isMember, destination: destinationPath);
    }
  }

  Future navigateToDeviceDetailScreen(String deviceId) async {
    var response =
        await _DeviceOptionUseCase.getDeviceDetail(deviceId, (p0) => null);
    if (response!.status == true) {
      _navigationHandler.navigateToDeviceDetail();
    }
  }

  Future<void> navigateToEnrolledScreen() async {
    await _navigationHandler.navigateToCustomerEnrollmentScreen('', true);
  }
}
