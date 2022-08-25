import 'package:flutter/material.dart';
import 'package:splash/navigation_handler/splash_navigation_handler.dart';
import 'package:splash/splash/state/splash_state.dart';
import 'package:splash/splash/view_model/splash_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

class SplashCoordinator extends BaseViewModel<SplashState> {
  final SplashNavigationHandler _navigationHandler;
  final SplashUseCase _splashUseCase;

  SplashCoordinator(this._navigationHandler, this._splashUseCase)
      : super(const SplashState.initialState());

  void initialiseState(
    BuildContext context,
    String title,
    String destinationPath,
  ) async {
    state = SplashState.ready(
      context: context,
      destinationPath: destinationPath,
      title: title,
    );
  }

  Future<bool> isSignedin() async {
    String number = await _splashUseCase.getOnBoardStatus();
    if (number.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getCurrentLocale() async {
   String currentLanguageCode = await _splashUseCase.getLocale();
    return currentLanguageCode;

  }

  Future<void> setCurrentLocale(String currentLanguageCode) async{
    String currentLang = await getCurrentLocale();
    if(currentLang == ''){
    var currentLocale = Locale(currentLanguageCode);
    Get.updateLocale(currentLocale);
    Intl.defaultLocale = currentLocale.languageCode;
    _splashUseCase.saveLocale(currentLanguageCode);
    }
  }

  Future<void> navigateToDestinationPath(
      String userType, bool isSignedin) async {
    _navigationHandler.navigateToDestinationPath(
        WelcomeScreenArgs('', '', userType, isSignedin));
  }
}
