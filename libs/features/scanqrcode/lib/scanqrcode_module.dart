import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:scanqrcode/service/scanqrcode_service.dart';
import 'package:scanqrcode/task_manager/scan_qr_code_api_resolver.dart';
import 'package:scanqrcode/task_manager/scanqrcode_module_resolver.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_coordinator.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_usecase.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_viewmodel.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'navigation_handler/scanqrcode_navigation_handler.dart';

class ScanQRCodeModule {
  static const moduleIdentifier = 'scanQrCodeModule';


  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      ScanQRCodeModuleResolver(
        ScanQrCodeApiResolver(
          ScanQRCodeService(),
        ),
      ),
    );

    DIContainer.container.registerFactory<ScanQRCodeCoordinator>(
          (container) =>
          ScanQRCodeCoordinator(
            ScanQRCodeNavigationHandler(container.resolve<NavigationManager>()),
            ScanQRCodeUseCase(
              ScanQRCodeViewModel(),
              container.resolve<TaskManager>(),
            ),
          ),
    );
  }
}
