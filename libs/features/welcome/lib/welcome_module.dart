import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';

import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/authorization_client.dart';
import 'package:network_manager/auth/user_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';
import 'package:welcome/sub_features/enrollment_success/viewmodel/enrollment_success_coordinator.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_usecase.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_coordinatior.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_view_model.dart';

import 'navigation_handler/welcome_navigation_handler.dart';
import 'sub_features/details/viewmodel/details_coordinator.dart';
import 'sub_features/details/viewmodel/details_view_model.dart';
import 'sub_features/signup/viewmodel/signup_coordinator.dart';


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

    DIContainer.container.registerFactory<SignUpCoordinator>(
          (container) => SignUpCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        SignupUseCase(
          SignupViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<DetailsCoordinator>(
          (container) => DetailsCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        DetailsUseCase(
          DetailsViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<EnrollmentSuccessCoordinator>(
          (container) => EnrollmentSuccessCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
      ),
    );

  }
}
