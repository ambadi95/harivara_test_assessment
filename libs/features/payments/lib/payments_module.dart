import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:payments/navigation_handler/payments_navigation_handler.dart';
import 'package:payments/service/payment_service.dart';
import 'package:payments/sub_features/payment_status/service/payment_status_service.dart';
import 'package:payments/sub_features/payment_status/view_model/payment_status_coordinator.dart';
import 'package:payments/sub_features/payment_status/view_model/payment_status_usecase.dart';
import 'package:payments/sub_features/payment_status/view_model/payment_status_view_model.dart';
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
        PaymentApiResolver(PaymentService(), PaymentStatusService()),
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

    DIContainer.container.registerFactory<PaymentStatusCoordinator>(
      (container) => PaymentStatusCoordinator(
        PaymentsNavigationHandler(container.resolve<NavigationManager>()),
        PaymentStatusUseCase(
          PaymentStatusViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
