import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:settings/navigation_handler/settings_navigation_handler.dart';
import 'package:settings/view_model/settings_coordinator.dart';
import 'package:settings/view_model/settings_usecase.dart';
import 'package:settings/view_model/settings_viewmodel.dart';
import 'package:task_manager/task_manager_impl.dart';

class SettingsModule {
  static const moduleIdentifier = 'settingsModule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<SettingsCoordinator>(
      (container) => SettingsCoordinator(
        SettingsNavigationHandler(container.resolve<NavigationManager>()),
        SettingsUseCase(
          SettingsViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
