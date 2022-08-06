import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/agent_nearby_screen.dart';

class AgentNearByRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case AgentNearBy.viewPath:
        return const AgentNearBy();
      default:
        // TODO: implement getView
        throw UnimplementedError();
    }
    throw Exception('Route ${settings.name} not found');
  }
}
