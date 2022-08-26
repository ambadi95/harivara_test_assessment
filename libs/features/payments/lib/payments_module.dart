import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:payments/navigation_handler/payments_navigation_handler.dart';
import 'package:payments/viewmodel/payments_coordinator.dart';
import 'package:payments/viewmodel/payments_usecase.dart';
import 'package:payments/viewmodel/payments_viewmodel.dart';

import 'package:task_manager/task_manager.dart';

class PaymentsModule {
  static const moduleIdentifier = 'paymentsmodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<PaymentsCoordinator>(
      (container) => PaymentsCoordinator(
        PaymentsNavigationHandler(container.resolve<NavigationManager>()),
        PaymentsUseCase(
          PaymentsViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
