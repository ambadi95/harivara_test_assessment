import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/login_screen.dart';

class LoginRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    if (settings.name == Login.viewPath) {

    }
    throw Exception('Route ${settings.name} not found');
  }
}
