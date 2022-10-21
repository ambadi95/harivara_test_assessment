import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import '../view/referral_program_screen.dart';


class ReferralProgramRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case ReferralProgram.viewPath:
        return const ReferralProgram();
      default:
        // TODO: implement getView
        throw UnimplementedError();
    }
    throw Exception('Route ${settings.name} not found');
  }
}
