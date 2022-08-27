import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/configuremdm_screen.dart';

class ConfigureMdmRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ConfigureMdmScreen.viewPath:
        return const ConfigureMdmScreen();
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
