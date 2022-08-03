
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:termscondition/termscondition/view_model/termscondition_coordinator.dart';
import 'package:termscondition/termscondition/view_model/termscondition_usecase.dart';
import 'package:termscondition/termscondition/view_model/termsconditon_viewmodel.dart';

import 'navigation_handler/terms_navigation_handler.dart';


class TermsConditionModule {
  static const moduleIdentifier = 'termsconditionModule';

  static void registerDependencies() {

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
