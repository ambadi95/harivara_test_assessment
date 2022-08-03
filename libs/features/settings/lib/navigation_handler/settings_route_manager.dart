import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';

import '../view/settings_view.dart';

class SettingsRouteManager extends IRouteManager{
  @override
  Widget getView(RouteSettings settings) {
    switch(settings.name){
      case Settings.viewPath :
        return const Settings();
    }
    throw UnimplementedError();
  }

}