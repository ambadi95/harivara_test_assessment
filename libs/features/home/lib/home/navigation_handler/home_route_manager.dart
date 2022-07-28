import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_screen_arguments.dart';

import '../view/home_screen.dart';

class HomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonHomeScreen.viewPath :
        var arguments = settings.arguments as HomeScreenArgs;

        return CrayonHomeScreen(
          homeScreenArgs: arguments,
        );
      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}
