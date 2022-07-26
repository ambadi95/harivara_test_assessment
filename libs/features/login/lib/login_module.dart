import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:login/viewmodel/login_coordinator.dart';
import 'package:login/viewmodel/login_usecase.dart';
import 'package:login/viewmodel/login_viewmodel.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/login_navigation_handler.dart';


class LoginModule {
  static const moduleIdentifier = 'loginModule';

  static void registerDependencies() {

    DIContainer.container.registerFactory<LoginCoordinator>(
          (container) => LoginCoordinator(
            LoginNavigationHandler(container.resolve<NavigationManager>()),
            LoginUseCase(
              LoginViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

  }
}
