import 'package:configuremdm/configuremdm_argument.dart';
import 'package:configuremdm/view/configuremdm_screen.dart';
import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import '../view/out_of_stock_success_screen.dart';
import '../view/scanqrcode_screen.dart';


class ScanQRCodeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ScanQrCodeScreen.viewPath:
       var arguments = settings.arguments as ScanQRCodeArgs;
       return ScanQrCodeScreen (
         scanQrcodeAgrs: arguments,
       );

      case ConfigureMdmScreen.viewPath:
        var arguments = settings.arguments as ConfigureMdmArgs;
        return ConfigureMdmScreen(
          configureMdmArgs : arguments,
        );

        case SuccessScreen.viewPath:
          var arguments = settings.arguments as String;
        return SuccessScreen(
         screenScreenArgs : arguments,
        );

        case OutOfStockSuccessScreen.viewPath:
        var arguments = settings.arguments as String;
        return OutOfStockSuccessScreen(
          screenScreenArgs : arguments,
        );

        default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
