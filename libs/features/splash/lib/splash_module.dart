import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:splash/splash/view_model/splash_coordinator.dart';
import 'package:splash/splash/view_model/splash_usecase.dart';
import 'package:splash/splash/view_model/splash_viewmodel.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/splash_navigation_handler.dart';

class SplashModule {
  static const moduleIdentifier = 'splashModule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<SplashCoordinator>(
      (container) => SplashCoordinator(
        SplashNavigationHandler(container.resolve<NavigationManager>()),
        SplashUseCase(
          SplashViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
