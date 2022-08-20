import 'dart:developer';

import 'package:config/Config.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:device_option/sub_features/device_loan_creation/state/device_loan_creation_state.dart';
import 'package:device_option/sub_features/device_loan_creation/viewmodel/device_loan_creation_usecase.dart';

import '../../../navigation_handler/device_option_navigation_handler.dart';


class DeviceLoanCreationCoordinator
    extends AnalyticsStateNotifier<DeviceLoanCreationState> {
  final DeviceOptionNavigationHandler _navigationHandler;
  final DeviceLoanCreationUseCase _DeviceOptionUseCase;

  DeviceLoanCreationCoordinator(
      this._navigationHandler,
      this._DeviceOptionUseCase,
      ) : super(const DeviceLoanCreationState.initialState());


}
