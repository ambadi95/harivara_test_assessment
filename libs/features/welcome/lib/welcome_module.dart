import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';

import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/authorization_client.dart';
import 'package:network_manager/auth/user_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_usecase.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_coordinatior.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_view_model.dart';

import 'navigation_handler/welcome_navigation_handler.dart';


class WelcomeModule {
  static const moduleIdentifier = 'welcomeModule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<WelcomeCoordinator>(
          (container) => WelcomeCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        WelcomeUseCase(
           WelcomeViewModel(),
          container.resolve<TaskManager>(),
       ),
     ),
   );
  }
}
