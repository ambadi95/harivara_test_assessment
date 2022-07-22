import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/login_screen.dart';

class LoginRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case Login.viewPath:
        return Login();
      default:
      // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
