import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:device_option/sub_features/device_details/service/device_option_service.dart';
import 'package:device_option/sub_features/device_details/viewmodel/device_detail_coordinator.dart';
import 'package:device_option/sub_features/device_details/viewmodel/device_detail_usecase.dart';
import 'package:device_option/sub_features/device_loan_creation/viewmodel/device_loan_creation_coordinator.dart';
import 'package:device_option/sub_features/device_loan_creation/viewmodel/device_loan_creation_usecase.dart';
import 'package:device_option/task_manager/device_option_api_resolver.dart';
import 'package:device_option/task_manager/device_option_module_resolver.dart';
import 'package:device_option/viewmodel/device_option_coordinator.dart';
import 'package:device_option/viewmodel/device_option_usecase.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/device_option_navigation_handler.dart';

class DeviceOptionModule {
  static const moduleIdentifier = 'deviceOptionModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      DeviceOptionModuleResolver(
        DeviceDetailApiResolver(
          DeviceOptionService(),
        ),
      ),
    );

    DIContainer.container.registerFactory<DeviceOptionCoordinator>(
      (container) => DeviceOptionCoordinator(
        DeviceOptionNavigationHandler(container.resolve<NavigationManager>()),
        DeviceOptionUseCase(
          container.resolve<IAuthManager>(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<DeviceDetailCoordinator>(
      (container) => DeviceDetailCoordinator(
        DeviceOptionNavigationHandler(container.resolve<NavigationManager>()),
        DeviceDetailUseCase(
          container.resolve<TaskManager>(),
          container.resolve<IAuthManager>(),
        ),
      ),
    );
    DIContainer.container.registerFactory<DeviceLoanCreationCoordinator>(
      (container) => DeviceLoanCreationCoordinator(
        DeviceOptionNavigationHandler(container.resolve<NavigationManager>()),
        DeviceLoanCreationUseCase(
          container.resolve<TaskManager>(),
          container.resolve<IAuthManager>(),
        ),
      ),
    );
  }
}
