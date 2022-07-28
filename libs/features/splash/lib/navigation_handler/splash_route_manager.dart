import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:splash/splash/view/splash.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';

class SplashRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonSplashScreen.viewPath:
        var arguments = settings.arguments as WelcomeScreenArgs;

        return CrayonSplashScreen(
          welcomeScreenArgs: arguments,
        );
      default:
      // TODO: implement getView
        throw UnimplementedError();
    }
  }
}