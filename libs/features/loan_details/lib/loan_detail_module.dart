import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';

import 'package:loan_details/viewmodel/loan_detail_coordinator.dart';
import 'package:loan_details/viewmodel/loan_detail_usecase.dart';

import 'package:task_manager/task_manager.dart';

import 'navigation_handler/loan_detail_navigation_handler.dart';
import 'viewmodel/loan_detail_viewmodel.dart';

class LoanDetailModule {
  static const moduleIdentifier = 'loandetailmodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<LoanDetailCoordinator>(
      (container) => LoanDetailCoordinator(
        LoanDetailNavigationHandler(container.resolve<NavigationManager>()),
        LoanDetailUseCase(
          LoanDetailViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
