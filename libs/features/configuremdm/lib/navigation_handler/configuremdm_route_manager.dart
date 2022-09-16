import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import '../configuremdm_argument.dart';
import '../view/configuremdm_screen.dart';
import '../view/configuremdm_successful_screen.dart';

class ConfigureMdmRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ConfigureMdmScreen.viewPath:
        var arguments = settings.arguments as ConfigureMdmArgs;
        return ConfigureMdmScreen(
          configureMdmArgs : arguments,
        );

      case ConfigureMdmSuccessScreen.viewPath:
        var arguments = settings.arguments as String;
        return ConfigureMdmSuccessScreen(
          imei: arguments,
        );
      case SuccessScreen.viewPath:
        var arguments = settings.arguments as String;
        return SuccessScreen(
          screenScreenArgs : arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
