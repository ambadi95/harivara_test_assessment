import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/device_option_screen.dart';


class DeviceOptionRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    if (settings.name == DeviceOption.viewPath) {

    }
    throw Exception('Route ${settings.name} not found');
  }
}
