import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:passcode/sub_features/passcode/task_manager/passcode_api_resolver.dart';
import 'package:passcode/sub_features/passcode/task_manager/passcode_module_resolver.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_coordinator.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_usecase.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_viewmodel.dart';
import 'package:task_manager/task_manager.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'navigation_handler/passcode_navigation_handler.dart';
import 'sub_features/passcode/service/passcode_service.dart';

class PasscodeModule {
  static const moduleIdentifier = 'passcodeModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      PasscodeModuleResolver(
        PasscodeApiResolver(
          PasscodeService(),
        ),
      ),
    );

    DIContainer.container.registerFactory<PasscodeCoordinator>(
      (container) => PasscodeCoordinator(
        PasscodeNavigationHandler(container.resolve<NavigationManager>()),
        PasscodeUseCase(
          PassCodeViewModel(),
          container.resolve<IAuthManager>(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
