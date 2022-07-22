import 'package:core/navigation/i_route_manager.dart';
import 'package:device_option/sub_features/device_details/view/device_detail_screen.dart';
import 'package:flutter/material.dart';

import '../view/device_option_screen.dart';


class DeviceOptionRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case DeviceOption.viewPath:
        return const DeviceOption();
      case DeviceDetailScreen.viewPath:
        return const DeviceDetailScreen();
      default:
      // TODO: implement getView
        throw UnimplementedError();
    }
    throw Exception('Route ${settings.name} not found');
  }
}
