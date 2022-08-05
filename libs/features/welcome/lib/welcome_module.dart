import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';

import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/authorization_client.dart';
import 'package:network_manager/auth/user_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/agent_details/viewmodel/agent_details_coordinator.dart';
import 'package:welcome/sub_features/agent_details/viewmodel/agent_details_usecase.dart';
import 'package:welcome/sub_features/agent_details/viewmodel/agent_details_view_model.dart';
import 'package:welcome/sub_features/agent_enrollment/viewmodel/agent_enrollment_coordinator.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';
import 'package:welcome/sub_features/enrollment_success/viewmodel/enrollment_success_coordinator.dart';
import 'package:welcome/sub_features/enrollment_success/viewmodel/enrollment_success_usecase.dart';
import 'package:welcome/sub_features/signup/service/signup_service.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_usecase.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_coordinatior.dart';
import 'package:welcome/sub_features/welcome/viewmodel/welcome_view_model.dart';
import 'package:welcome/sub_features/welcome_back/viewmodel/welcome_back_coordinatior.dart';
import 'package:welcome/sub_features/welcome_back/viewmodel/welcome_back_usecase.dart';
import 'package:welcome/sub_features/welcome_back/viewmodel/welcome_back_view_model.dart';
import 'package:welcome/task_manager/signup_api_resolver.dart';
import 'package:welcome/task_manager/signup_module_resolver.dart';
import 'navigation_handler/welcome_navigation_handler.dart';
import 'sub_features/details/service/details_service.dart';
import 'sub_features/details/viewmodel/details_coordinator.dart';
import 'sub_features/details/viewmodel/details_view_model.dart';
import 'sub_features/signup/viewmodel/signup_coordinator.dart';

class WelcomeModule {
  static const moduleIdentifier = 'welcomeModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      SignupModuleResolver(
        SignupApiResolver(
          SignupService(),
          DetailsService(),
          EnrollmentService(),
        ),
      ),
    );

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
          container.resolve<IAuthManager>(),
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

    DIContainer.container.registerFactory<AgentDetailsCoordinator>(
      (container) => AgentDetailsCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        AgentDetailsUseCase(
          AgentDetailsViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<WelcomeBackCoordinator>(
      (container) => WelcomeBackCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        WelcomeBackUseCase(
          WelcomeBackViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<EnrollmentSuccessCoordinator>(
      (container) => EnrollmentSuccessCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
        EnrollmentSuccessUseCase(
          container.resolve<IAuthManager>(),
          container.resolve<TaskManager>(),
        ),
      ),
    );

    DIContainer.container.registerFactory<AgentEnrollmentCoordinator>(
      (container) => AgentEnrollmentCoordinator(
        WelcomeNavigationHandler(container.resolve<NavigationManager>()),
      ),
    );
  }
}
