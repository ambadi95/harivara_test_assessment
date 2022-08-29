import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_coordinator.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_usecase.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_viewmodel.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'navigation_handler/scanqrcode_navigation_handler.dart';

class ScanQRCodeModule {
  static const moduleIdentifier = 'scanqrcodemodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<ScanQRCodeCoordinator>(
      (container) => ScanQRCodeCoordinator(
        ScanQRCodeNavigationHandler(container.resolve<NavigationManager>()),
        ScanQRCodeUseCase(
          ScanQRCodeViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
