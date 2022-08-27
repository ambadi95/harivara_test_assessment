import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/scanqrcode_screen.dart';


class ScanQRCodeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ScanQrCodeScreen.viewPath:
       // var arguments = settings.arguments as ScanQrCodeScreenArgs;
        return const ScanQrCodeScreen();
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
