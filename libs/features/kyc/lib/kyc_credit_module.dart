import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:kyc/navigation_handler/kyc_credit_navigation_handler.dart';
import 'package:kyc/task_manager/kyc_credit_module_resolver.dart';
import 'package:kyc/viewmodel/kyc_credit_coordinator.dart';
import 'package:kyc/viewmodel/kyc_credit_usecase.dart';
import 'package:kyc/viewmodel/kyc_credit_viewmodel.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager.dart';

class KycCreditModule {
  static const moduleIdentifier = 'kyccreditmodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<KycCreditCoordinator>(
      (container) => KycCreditCoordinator(
        KycCreditNavigationHandler(container.resolve<NavigationManager>()),
        KycCreditUseCase(
          KycCreditViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
