import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:payments/navigation_handler/payments_navigation_handler.dart';
import 'package:payments/service/payment_service.dart';
import 'package:payments/task_manager/payment_api_resolver.dart';
import 'package:payments/task_manager/payment_module_resolver.dart';
import 'package:payments/viewmodel/payments_coordinator.dart';
import 'package:payments/viewmodel/payments_usecase.dart';
import 'package:payments/viewmodel/payments_viewmodel.dart';

import 'package:task_manager/task_manager.dart';

class PaymentsModule {
  static const moduleIdentifier = 'paymentsmodule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      PaymentModuleResolver(
        PaymentApiResolver(
          PaymentService(),
        ),
      ),
    );

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
