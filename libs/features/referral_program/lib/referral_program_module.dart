
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:referral_program/service/referral_program_service.dart';
import 'package:referral_program/task_manager/referral_program_api_resolver.dart';
import 'package:referral_program/task_manager/referral_program_module_resolver.dart';
import 'package:referral_program/viewmodel/referral_program_coordinator.dart';
import 'package:referral_program/viewmodel/referral_program_usecase.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/referral_program_navigation_handler.dart';

class ReferralProgramModule {
  static const moduleIdentifier = 'referralProgramModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      AgentNearByModuleResolver(ReferralProgramApiResolver(ReferralProgramService())),
    );

    DIContainer.container.registerFactory<ReferralProgramCoordinator>(
      (container) => ReferralProgramCoordinator(
        ReferralProgramNavigationHandler(container.resolve<NavigationManager>()),
          ReferralProgramUseCase( container.resolve<TaskManager>())
      ),
    );
  }
}
