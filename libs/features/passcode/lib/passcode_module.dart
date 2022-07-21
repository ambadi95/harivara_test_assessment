

import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_coordinator.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_usecase.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_viewmodel.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/passcode_navigation_handler.dart';

class PasscodeModule{
  static const moduleIdentifier = 'passcodeModule';

  static void registerDependencies() {

    DIContainer.container.registerFactory<PasscodeCoordinator>(
          (container) => PasscodeCoordinator(
        PasscodeNavigationHandler(container.resolve<NavigationManager>()),
        PasscodeUseCase(
          PassCodeViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }

}