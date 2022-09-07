import 'package:configuremdm/state/configuremdm_state.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';

import '../navigation_handler/configuremdm_navigation_handler.dart';
import 'configuremdm_usecase.dart';

class ConfigureMdmCoordinator
    extends AnalyticsStateNotifier<ConfigureMdmState> {
  final ConfigureMdmNavigationHandler _navigationHandler;
  final ConfigureMdmUseCase _configuremdmUseCase;

  ConfigureMdmCoordinator(
    this._navigationHandler,
    this._configuremdmUseCase,
  ) : super(const ConfigureMdmState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        ConfigureMdmState.ready(context: context, error: "", isLoading: false);
  }
}
