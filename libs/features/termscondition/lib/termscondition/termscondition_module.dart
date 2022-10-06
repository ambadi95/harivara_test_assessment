import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:termscondition/termscondition/service/term_condition_service.dart';
import 'package:termscondition/termscondition/task_manager/term_condition_api_resolver.dart';
import 'package:termscondition/termscondition/task_manager/term_condition_module_resolver.dart';
import 'package:termscondition/termscondition/view_model/termscondition_coordinator.dart';
import 'package:termscondition/termscondition/view_model/termscondition_usecase.dart';
import 'package:termscondition/termscondition/view_model/termsconditon_viewmodel.dart';
import 'navigation_handler/terms_navigation_handler.dart';

class TermsConditionModule {
  static const moduleIdentifier = 'termsconditionModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      TermConditionModuleResolver(
        TermConditionApiResolver(
          TermConditionService(),
        ),
      ),
    );

    DIContainer.container.registerFactory<TermsConditionCoordinator>(
      (container) => TermsConditionCoordinator(
        TermsConditionNavigationHandler(container.resolve<NavigationManager>()),
        TermsConditionUseCase(
          TermsConditionViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
