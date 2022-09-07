import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:payments/view/payments_screen.dart';
import 'package:shared_data_models/payments/payment_status_screen_args.dart';
import 'package:shared_data_models/payments/payment_sucess_screen_args.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';

import '../sub_features/payment_status/view/payment_status_screen.dart';
import '../sub_features/payment_status/view/payment_success_screen.dart';

class PaymentsRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case PaymentsScreen.viewPath:
        var arguments = settings.arguments as PaymentsScreenArgs;
        return PaymentsScreen(
          paymentsScreenArgs: arguments,
        );
      case PaymentStatusScreen.viewPath:
        var arguments = settings.arguments as PaymentsStatusScreenArgs;
        return PaymentStatusScreen(
          paymentsStatusScreenArgs: arguments,
        );
      case PaymentSuccessScreen.viewPath:
        var arguments = settings.arguments as PaymentSuccessScreenArgs;
        return PaymentSuccessScreen(
          screenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
