import 'dart:ui';
import 'package:core/mobile_core.dart';
import 'package:welcome/sub_features/welcome/state/welcome_screen_state.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'welcome_usecase.dart';
import 'package:config/Config.dart';

class WelcomeCoordinator extends BaseViewModel<WelcomeScreenState> {
  final WelcomeNavigationHandler _navigationHandler;
  final WelcomeUseCase _welcomeUseCase;

  WelcomeCoordinator(
    this._navigationHandler,
    this._welcomeUseCase,
  ) : super(const WelcomeScreenState(
          currentLanguageCode: '',
        ));

  Future<void> getCurrentLocale() async {
    var currentLanguageCode = '';
    currentLanguageCode = await _welcomeUseCase.getLocale();
    var currentLocale = Locale(currentLanguageCode);
    Get.updateLocale(currentLocale);
    Intl.defaultLocale = currentLocale.languageCode;
    state = state.copyWith(
      currentLanguageCode: currentLanguageCode,
    );
  }

  Future<void> setCurrentLocale(String currentLanguageCode,UserType userType) async {
    String selectedLanguage = currentLanguageCode == 'sw' ? 'SW' : 'ENG';
    var currentLocale = Locale(currentLanguageCode);
    Get.updateLocale(currentLocale);
    Intl.defaultLocale = currentLocale.languageCode;
    _welcomeUseCase.saveLocale(currentLanguageCode);
    state = state.copyWith(
      currentLanguageCode: currentLanguageCode,
    );
    if(userType == UserType.Customer) {
      String customerID = await _welcomeUseCase.getCustomerId();
      if (customerID != '') {
        var response = await _welcomeUseCase.setPreferences(
            selectedLanguage, (p0) => null);
      }
    }
  }

  Future navigateToSignUpScreen(UserType userType) async {
    _navigationHandler.navigateToSignUpScreen(userType);
  }

  Future navigateToLogin(UserType userType) async {
    _navigationHandler.navigateToLogin(userType);
  }
}
