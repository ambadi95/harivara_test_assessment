import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/agent_nearby_screen.dart';

class AgentNearByRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    if (settings.name == AgentNearBy.viewPath) {

    }
    throw Exception('Route ${settings.name} not found');
  }
}
