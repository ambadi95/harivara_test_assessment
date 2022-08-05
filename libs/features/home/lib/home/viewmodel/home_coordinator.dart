import 'package:flutter/material.dart';
import 'package:task_manager/base_classes/base_view_model.dart';

import '../navigation_handler/home_navigation_handler.dart';
import '../state/home_screen_state.dart';
import 'home_usecase.dart';

class HomeCoordinator extends BaseViewModel<HomeScreenState> {
  final HomeUserCase _customerHomeUseCase;
  final HomeNavigationHandler _navigationHandler;
  HomeCoordinator(this._navigationHandler, this._customerHomeUseCase)
      : super(const HomeScreenState.initialState());

  void initialiseState(
      BuildContext context, String error, bool isAgent, bool isLoading) async {
    state = HomeScreenState.ready(
        context: context, error: error, isAgent: isAgent, isLoading: isLoading);
  }

  void navigateToCustomerRegister() {
    _navigationHandler.navigateToSignUpScreen('Customer');
  }

  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToSettingsScreen() {
    _navigationHandler.navigateToSettingsScreen();
  }
}
