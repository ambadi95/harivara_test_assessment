import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:kyc/subfeatures/kycmain/viewmodel/kyc_credit_main_coordinator.dart';
import 'package:kyc/subfeatures/kycmain/viewmodel/kyc_credit_main_usecase.dart';
import 'package:kyc/subfeatures/kycmain/viewmodel/kyc_credit_main_viewmodel.dart';
import 'package:task_manager/task_manager.dart';

import 'navigation_handler/kyc_main_navigation_handler.dart';

class KycCreditMainModule {
  static const moduleIdentifier = 'kyccreditmainmodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<KycCreditMainCoordinator>(
      (container) => KycCreditMainCoordinator(
        KycCreditMainNavigationHandler(container.resolve<NavigationManager>()),
        KycCreditMainUseCase(
          KycCreditMainViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
