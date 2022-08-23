import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:kyc/subfeatures/kycmain/view/kyc_credit_main_screen.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';


class KycCreditMainRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case KycCreditMainScreen.viewPath:
        var arguments = settings.arguments as KycScreenArgs;
        return KycCreditMainScreen(
          kycScreenArgs: arguments,
        );
      default:
      // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
