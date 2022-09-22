import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:config/Config.dart';

class DownPaymentNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DownPaymentNavigationHandler(this._navigationManager);

  Future<void> navigateToScanQrCode(int? deviceId, String modelName) async {
    var arguments = ScanQRCodeArgs(deviceId!, modelName);
    _navigationManager.navigateTo(
        ScanQrCodeScreen.viewPath,
        const NavigationType.push(),
        arguments: arguments
        );
  }

  Future<void> goBack() async {
    var args = HomeScreenArgs(userType: UserType.Agent, isAgent: true);
    _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: args);
  }
}
