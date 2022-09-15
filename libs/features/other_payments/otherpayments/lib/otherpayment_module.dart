import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:other_payment/service/otherpayment_service.dart';
import 'package:other_payment/task_manager/otherpayment_api_resolver.dart';
import 'package:other_payment/task_manager/otherpayment_module_resolver.dart';
import 'package:other_payment/viewmodel/otherpayment_coordinator.dart';
import 'package:other_payment/viewmodel/otherpayment_usecase.dart';
import 'package:other_payment/viewmodel/otherpayment_viewmodel.dart';


import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/other_payment_navigation_handler.dart';

class OtherPaymentModule {
  static const moduleIdentifier = 'OtherPaymentModule';

  static void registerDependencies() {


    ModuleResolver.registerResolver(
      moduleIdentifier,
      OtherPaymentModuleResolver(
        OtherPaymentApiResolver(
          IOtherPaymentService(),
        ),
      ),
    );
    DIContainer.container.registerFactory<OtherPaymentCoordinator>(
      (container) => OtherPaymentCoordinator(
        OtherPaymentNavigationHandler(container.resolve<NavigationManager>()),
        OtherPaymentUseCase(
          OtherPaymentViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
