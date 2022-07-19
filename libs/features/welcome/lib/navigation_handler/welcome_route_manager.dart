import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';

import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';

import '../sub_features/welcome/data_model/welcome_model.dart';

class WelcomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonWelcomScreen.viewPath:
        var arguments = settings.arguments as WelcomeScreenArgs;
        return CrayonWelcomScreen(
          welcomeScreenArgs: arguments,
        );
      default:
        throw UnimplementedError();
    }
  }
}
