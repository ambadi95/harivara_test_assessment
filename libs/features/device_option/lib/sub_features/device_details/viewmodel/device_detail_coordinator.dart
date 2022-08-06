import 'package:core/view/analytics_state_notifier.dart';

import '../../../navigation_handler/device_option_navigation_handler.dart';
import '../state/device_detail_state.dart';
import 'device_detail_usecase.dart';

class DeviceDetailCoordinator
    extends AnalyticsStateNotifier<DeviceDetailState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceDetailUseCase _DeviceOptionUseCase;

  DeviceDetailCoordinator(
    this._navigationHandler,
    this._DeviceOptionUseCase,
  ) : super(const DeviceDetailState());

  Future fetchDeviceList(bool isMember, String destinationPath) async {
    var response = await _DeviceOptionUseCase.getDeviceList((p0) => null);
    if (response!.status == true) {
      // state = DeviceDetailState.ready(
      //     isMember: isMember, destination: destinationPath);
    }
  }

  Future<void> navigateToEnrolledScreen() async {
    await _navigationHandler.navigateToCustomerEnrollmentScreen('', true);
  }
}
