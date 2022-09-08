import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class DownPaymentNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DownPaymentNavigationHandler(this._navigationManager);

  Future<void> navigateToScanQrCode(int? deviceId) async {
    var arguments = deviceId;
    _navigationManager.navigateTo(
        ScanQrCodeScreen.viewPath,
        const NavigationType.push(),
        arguments: arguments
        );
  }
}
