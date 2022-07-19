import 'dart:ui';
import 'package:welcome/sub_features/welcome/state/welcome_screen_state.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'welcome_usecase.dart';

class WelcomeCoordinator extends BaseViewModel<WelcomeScreenState>{
  final WelcomeNavigationHandler _navigationHandler;
  final WelcomeUseCase _welcomeUseCase;

  WelcomeCoordinator(
      this._navigationHandler,
      this._welcomeUseCase,) : super(const WelcomeScreenState(
    currentLanguageCode: 'en',
  ));


  void setCurrentLocale(String currentLanguageCode) {
    var currentLocale = Locale(currentLanguageCode);
    Get.updateLocale(currentLocale);
    Intl.defaultLocale = currentLocale.languageCode;
    _welcomeUseCase.saveLocale(currentLanguageCode);
    state = state.copyWith(
      currentLanguageCode: currentLanguageCode,
    );
  }

}