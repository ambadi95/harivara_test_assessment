import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:offline_payment/service/offlinepayment_service.dart';
import 'package:downpayment/task_manager/downpayment_api_resolver.dart';
import 'package:downpayment/task_manager/downpayment_module_resolver.dart';
import 'package:downpayment/viewmodel/downpayment_coordinator.dart';
import 'package:downpayment/viewmodel/downpayment_usecase.dart';
import 'package:downpayment/viewmodel/downpayment_viewmodel.dart';
import 'package:kyc/navigation_handler/kyc_credit_navigation_handler.dart';
import 'package:offline_payment/task_manager/offlinepayment_api_resolver.dart';
import 'package:offline_payment/task_manager/offlinepayment_module_resolver.dart';
import 'package:offline_payment/viewmodel/offlinepayment_coordinator.dart';
import 'package:offline_payment/viewmodel/offlinepayment_usecase.dart';
import 'package:offline_payment/viewmodel/offlinepayment_viewmodel.dart';

import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/offline_payment_navigation_handler.dart';

class OfflinePaymentModule {
  static const moduleIdentifier = 'OfflinePaymentModule';

  static void registerDependencies() {


    ModuleResolver.registerResolver(
      moduleIdentifier,
      OfflinePaymentModuleResolver(
        OfflinePaymentApiResolver(
          IOfflinePaymentService(),
        ),
      ),
    );
    DIContainer.container.registerFactory<OfflinePaymentCoordinator>(
      (container) => OfflinePaymentCoordinator(
        OfflinePaymentNavigationHandler(container.resolve<NavigationManager>()),
        OfflinePaymentUseCase(
          OfflinePaymentViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
