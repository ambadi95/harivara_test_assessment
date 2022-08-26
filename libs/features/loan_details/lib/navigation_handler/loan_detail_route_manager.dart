import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:loan_details/view/loan_detail_screen.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/loan_detail/loan_detail_screen_args.dart';

class LoanDetailRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case LoanDetailScreen.viewPath:
        var arguments = settings.arguments as LoanDetailArgs;
        return LoanDetailScreen(
          loanDetailArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw Exception('Route ${settings.name} not found');
    }
  }
}
