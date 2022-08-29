import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:payments/view/payments_screen.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';

class PaymentsRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case PaymentsScreen.viewPath:
        var arguments = settings.arguments as PaymentsScreenArgs;
        return PaymentsScreen(
          paymentsScreenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
