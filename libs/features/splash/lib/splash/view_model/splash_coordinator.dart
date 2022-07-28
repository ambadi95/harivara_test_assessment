import 'package:flutter/material.dart';
import 'package:splash/navigation_handler/splash_navigation_handler.dart';
import 'package:splash/splash/state/splash_state.dart';
import 'package:splash/splash/view_model/splash_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';


class SplashCoordinator extends BaseViewModel<SplashState> {
  final SplashNavigationHandler _navigationHandler;
  final SplashUseCase _splashUseCase;

  SplashCoordinator(this._navigationHandler, this._splashUseCase)
      : super(const SplashState.initialState());

  void initialiseState(BuildContext context,
      String title,
      String destinationPath,
      ) async {
    state = SplashState.ready(
      context: context,
      destinationPath: destinationPath,
      title: title,
     
    );
  }





  Future<void> navigateToDestinationPath(String destinationPath) async {
    _navigationHandler.navigateToDestinationPath(destinationPath);
  }

}
