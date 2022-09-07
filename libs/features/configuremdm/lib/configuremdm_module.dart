import 'package:configuremdm/task_manager/configuremdm_api_resolver.dart';
import 'package:configuremdm/task_manager/configuremdm_module_resolver.dart';
import 'package:configuremdm/viewmodel/configuremdm_coordinator.dart';
import 'package:configuremdm/viewmodel/configuremdm_usecase.dart';
import 'package:configuremdm/viewmodel/configuremdm_viewmodel.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager.dart';
import 'navigation_handler/configuremdm_navigation_handler.dart';

class ConfigureMdmModule {
  static const moduleIdentifier = 'configuremdmodule';

  static void registerDependencies() {


    ModuleResolver.registerResolver(
      moduleIdentifier,
      ConfigureMdmModuleResolver(
        ConfigureMdmApiResolver(
          //IDownPaymentService(),
        ),
      ),
    );
    DIContainer.container.registerFactory<ConfigureMdmCoordinator>(
      (container) => ConfigureMdmCoordinator(
        ConfigureMdmNavigationHandler(container.resolve<NavigationManager>()),
        ConfigureMdmUseCase(
          ConfigureMdmViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
