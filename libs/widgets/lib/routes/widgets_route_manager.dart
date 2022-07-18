import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/error/network_error.dart';
import 'package:widget_library/miscellaneous/busy_modal/busy_modal_view.dart';
import 'package:widget_library/video/full_screen_video_widget.dart';

class WidgetsRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case FullScreenVideoPage.viewPath:
        return FullScreenVideoPage(videoId: arguments['videoId'] as String);
      case NetworkErrorScreen.viewPath:
        return NetworkErrorScreen();
      default:
        throw Exception('View ${settings.name} not found');
    }
  }

  @override
  Widget getDialog(String dialogName, dynamic arguments) {
    switch (dialogName) {
      case CrayonPaymentBusyView.viewPath:
        return CrayonPaymentBusyView();
      default:
        throw Exception('Dialog ${dialogName} not found');
    }
  }
}
