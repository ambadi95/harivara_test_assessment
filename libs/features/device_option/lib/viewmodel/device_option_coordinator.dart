
import 'package:core/view/analytics_state_notifier.dart';

import '../navigation_handler/device_option_navigation_handler.dart';
import '../state/device_option_state.dart';
import 'device_option_usecase.dart';

class DeviceOptionCoordinator extends AnalyticsStateNotifier<DeviceOptionState>{

  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceOptionUseCase _DeviceOptionUseCase;

  DeviceOptionCoordinator( this._navigationHandler,
      this._DeviceOptionUseCase,) : super(const DeviceOptionState());
}