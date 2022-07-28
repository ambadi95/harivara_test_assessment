import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:splash/splash/splash_screen_args.dart';
import 'package:splash/splash/view/splash.dart';

class SplashRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonSplashScreen.viewPath:
        var arguments = settings.arguments as SplashScreenArgs;

        return CrayonSplashScreen(
          splashScreenArgs: arguments,
        );
      default:
      // TODO: implement getView
        throw UnimplementedError();
    }
  }
}