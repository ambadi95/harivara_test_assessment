import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/home_screen.dart';

class CustomerHomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonCustomerHomeScreen.viewPath :
          return CrayonCustomerHomeScreen();
      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}
