import 'package:settings/state/settings_state.dart';
import 'package:settings/view_model/settings_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';

import '../navigation_handler/settings_navigation_handler.dart';

class SettingsCoordinator extends BaseViewModel<SettingsState> {
  final SettingsUseCase _settingsUseCase;
  final SettingsNavigationHandler _navigationHandler;

  SettingsCoordinator(this._navigationHandler, this._settingsUseCase)
      : super(const SettingsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  Future<void> resetPasscode() async {
    await _navigationHandler.navigateToSignUpScreen();
  }

  Future<void> changeLanguage() async {
    await _navigationHandler.navigateToAgentChangeLanguageBottomSheet();
  }

  Future<void> navigateToUpdateProfile() async {
    await _navigationHandler.navigateToAgentDetailScreen();
  }

  Future<void> navigateToCustomerProfileScreen() async {
    await _navigationHandler.navigateToCustomerDetailScreen();
  }

  Future<void> signOut() async {
    await _settingsUseCase.logout();
    await _navigationHandler.signOut();
  }

    Future<void> navigateToTermsCondtionsScreen() async {
      await _navigationHandler.navigateToTermsCondtionsScreen();

  }
}
