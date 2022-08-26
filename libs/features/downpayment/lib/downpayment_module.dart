import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:downpayment/viewmodel/downpayment_coordinator.dart';
import 'package:downpayment/viewmodel/downpayment_usecase.dart';
import 'package:downpayment/viewmodel/downpayment_viewmodel.dart';
import 'package:kyc/navigation_handler/kyc_credit_navigation_handler.dart';

import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/down_payment_navigation_handler.dart';

class DownPaymentModule {
  static const moduleIdentifier = 'downpaymentmodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<DownPaymentCoordinator>(
      (container) => DownPaymentCoordinator(
        DownPaymentNavigationHandler(container.resolve<NavigationManager>()),
        DownPaymentUseCase(
          DownPaymentViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
