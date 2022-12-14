import 'package:config/Config.dart';
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

  Future<void> resetPasscode(UserType userType) async {
    await _navigationHandler.navigateToResetPasscode(userType);
  }

  Future<void> changeLanguage(UserType userType) async {
    await _navigationHandler.navigateToAgentChangeLanguageBottomSheet(userType);
  }

  Future<void> navigateToUpdateProfile() async {
    await _navigationHandler.navigateToAgentDetailScreen();
  }

  Future<void> navigateToCustomerProfileScreen() async {
    await _navigationHandler.navigateToCustomerDetailScreen();
  }

  Future<void> signOut(UserType userType) async {
    await _settingsUseCase.logout();
    await _navigationHandler.signOut(userType);
  }

  Future<void> navigateToTermsCondtionsScreen(bool isFaq) async {
    await _navigationHandler.navigateToTermsCondtionsScreen(isFaq);
  }

  Future<void> navigateToAgentNearBy() async {
    await _navigationHandler.navigateToAgentNearBy();
  }

  Future<void> navigateToReferralProgram() async {
    await _navigationHandler.navigateToReferralProgram();
  }

  void navigateToBrowser(){
    _navigationHandler.navigateToTermsCondition();
  }
}
