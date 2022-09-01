import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';

import '../view/down_payment_screen.dart';

class DownPaymentRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case DownPaymentScreen.viewPath:
       // var arguments = settings.arguments as DownPaymentScreenArgs;
        return const DownPaymentScreen(
          //downPaymentScreenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
