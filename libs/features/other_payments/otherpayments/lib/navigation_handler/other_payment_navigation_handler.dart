import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:shared_data_models/offlinepayment/offlinepayment_screen_args.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:config/Config.dart';
import 'package:offline_payment/view/offline_payment_screen.dart';

class OtherPaymentNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  OtherPaymentNavigationHandler(this._navigationManager);

  Future<void> navigateToScanQrCode(int? deviceId) async {
    var arguments = deviceId;
    _navigationManager.navigateTo(
        ScanQrCodeScreen.viewPath,
        const NavigationType.push(),
        arguments: arguments
        );
  }

  Future<void> navigateOfflinePaymentScreen(int deviceId, String modelName, OtherPaymentScreenArgs otherPaymentScreenArgs) async {
    var arguments = OfflinePaymentScreenArgs(deviceId, modelName,otherPaymentScreenArgs.isOutOfStock,otherPaymentScreenArgs.bottomSheetShown);
    _navigationManager.navigateTo(
        OfflinePaymentScreen.viewPath,
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
