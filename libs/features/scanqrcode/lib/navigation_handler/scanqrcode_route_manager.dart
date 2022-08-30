import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import '../view/scanqrcode_screen.dart';


class ScanQRCodeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ScanQrCodeScreen.viewPath:
       var arguments = settings.arguments as ScanQRCodeArgs;
       return ScanQrCodeScreen (
         scanQRCodeArgs: arguments,
       );

        case SuccessScreen.viewPath:
          var arguments = settings.arguments as String;
        return SuccessScreen(
          username : arguments,
        );

        default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
