import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/webview/webview.dart';

import '../view/home_screen.dart';

class HomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonHomeScreen.viewPath:
        var arguments = settings.arguments as HomeScreenArgs;

        return CrayonHomeScreen(
          homeScreenArgs: arguments,
        );

      case WebViewPage.viewPath:
        var arguments = settings.arguments as Map<String, String>;
        var text = arguments['text'];
        var link = arguments['path'];

        return WebViewPage(
          title: TextUIDataModel(text!),
          launchType: LaunchType.Network,
          url: link,
          leadingActionIcon: const Icon(Icons.arrow_back),
        );
      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}
