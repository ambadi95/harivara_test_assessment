import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';

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
      case SignUp.viewPath :
          return const SignUp();
      case DetailsScreen.viewPath :
        return const DetailsScreen();
      default:
        throw UnimplementedError();
    }
  }
}
