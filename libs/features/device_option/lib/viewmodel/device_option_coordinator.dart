import 'package:config/Config.dart';
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
      return response.data;
      // state = DeviceOptionState.ready(
      //     isMember: isMember, destination: destinationPath);
    }
  }

  Future navigateToDeviceDetailScreen(int deviceId, UserType userType) async {
    _navigationHandler.navigateToDeviceDetail(deviceId,userType);
  }

  Future<void> navigateToEnrolledScreen(UserType userType) async {
    await _navigationHandler.navigateToCustomerEnrollmentScreen('', userType);
  }
}
