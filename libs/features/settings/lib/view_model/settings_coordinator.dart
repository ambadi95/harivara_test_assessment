import 'package:settings/state/settings_state.dart';
import 'package:settings/view_model/settings_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';

import '../navigation_handler/settings_navigation_handler.dart';

class SettingsCoordinator extends BaseViewModel<SettingsState>{
  final SettingsUseCase _settingsUseCase;
  final SettingsNavigationHandler _navigationHandler;
  SettingsCoordinator(this._navigationHandler, this._settingsUseCase) : super(const SettingsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

}