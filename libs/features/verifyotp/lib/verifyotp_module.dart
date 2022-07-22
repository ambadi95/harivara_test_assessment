

import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:task_manager/task_manager.dart';
import 'package:verifyotp/navigation_handler/verifyotp_navigation_handler.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_coordinator.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_usecase.dart';
import 'package:verifyotp/verifyotp/view_model/verifyotp_viewmodel.dart';

class VerifyOtpModule{
  static const moduleIdentifier = 'VerifyOtpModule';

  static void registerDependencies() {

    DIContainer.container.registerFactory<VerifyOtpCoordinator>(
          (container) => VerifyOtpCoordinator(
        VerifyOtpNavigationHandler(container.resolve<NavigationManager>()),
            VerifyOtpUseCase(
          VerifyOtpViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }

}