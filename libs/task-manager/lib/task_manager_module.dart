import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/storage/storage_service.dart';
import 'package:task_manager/cache_manager/storage/CrayonPayment_storage_service.dart';
import 'package:core/translation/app_localization_service.dart';
import 'package:task_manager/session_management/inactivity_service_impl.dart';
import 'package:task_manager/session_management/session_timeout_manager.dart';
import 'package:task_manager/stream_observer/data_change_observer_resolver.dart';

import 'task_manager_impl.dart';

class TaskManagerModule {
  static void registerDependencies() {
    DIContainer.container.registerSingleton((container) => TaskManager());
    DIContainer.container
        .registerSingleton((container) => AppLocalizationService());
    DIContainer.container
        .registerSingleton((container) => DataChangeObserverTaskResolver());
    DIContainer.container.registerSingleton<IInactivityService>(
      (container) => InactivityService(
        taskManager: container.resolve<TaskManager>(),
        navigationManager: container.resolve<NavigationManager>(),
      ),
    );
    DIContainer.container.registerFactory<IStorageService>(
      (container) => CrayonPaymentStorageService(
        container.resolve<TaskManager>(),
      ),
    );
    DIContainer.container.registerSingleton(
      (container) => SessionTimeoutManager(
        taskManager: DIContainer.container.resolve(),
        localization: DIContainer.container.resolve(),
      ),
    );
  }
}
