
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:device_option/viewmodel/device_option_coordinator.dart';
import 'package:device_option/viewmodel/device_option_usecase.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/device_option_navigation_handler.dart';




class DeviceOptionModule {
  static const moduleIdentifier = 'deviceOptionModule';

  static void registerDependencies() {

    DIContainer.container.registerFactory<DeviceOptionCoordinator>(
          (container) => DeviceOptionCoordinator(
            DeviceOptionNavigationHandler(container.resolve<NavigationManager>()),
            DeviceOptionUseCase(
          container.resolve<TaskManager>(),
        ),
      ),
    );

  }
}
