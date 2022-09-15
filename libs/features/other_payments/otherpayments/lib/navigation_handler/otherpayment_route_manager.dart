
  import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:other_payment/view/other_payment_screen.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';

class OtherPaymentRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case OtherPaymentScreen.viewPath:
        var arguments = settings.arguments as OtherPaymentScreenArgs;
        return OtherPaymentScreen(
          otherPaymentScreenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
