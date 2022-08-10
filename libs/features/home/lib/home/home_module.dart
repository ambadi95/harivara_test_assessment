import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:home/home/service/home_service.dart';
import 'package:home/home/task_manager/home_api_resolver.dart';
import 'package:home/home/task_manager/home_module_resolver.dart';
import 'package:home/home/viewmodel/home_coordinator.dart';
import 'package:home/home/viewmodel/home_usecase.dart';
import 'package:home/home/viewmodel/home_view_model.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/home_navigation_handler.dart';

class HomeModule {
  static const moduleIdentifier = 'homemodule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      HomeModuleResolver(
        HomeApiResolver(
          HomeService(),
        ),
      ),
    );

    DIContainer.container.registerFactory<HomeCoordinator>(
      (container) => HomeCoordinator(
          HomeNavigationHandler(container.resolve<NavigationManager>()),
          HomeUserCase(
            HomeViewModel(),
            container.resolve<IAuthManager>(),
            container.resolve<TaskManager>(),
          )),
    );
  }
}
