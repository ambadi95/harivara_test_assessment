import 'package:core/navigation/i_route_manager.dart';
import 'package:device_option/sub_features/device_details/view/device_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';

import '../view/device_option_screen.dart';

class DeviceOptionRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case DeviceOption.viewPath:
        var arguments = settings.arguments as DeviceOptionArgs;

        return DeviceOption(
          deviceOptionArgs: arguments,
        );
      case DeviceDetailScreen.viewPath:
        var arguments = settings.arguments as Map;

        return DeviceDetailScreen(
          deviceId: arguments['id'],
          userType: arguments['userType'],
        );
      default:
        // TODO: implement getView
        throw UnimplementedError();
    }
    throw Exception('Route ${settings.name} not found');
  }
}
