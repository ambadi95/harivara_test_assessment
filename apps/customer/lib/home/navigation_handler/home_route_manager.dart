import 'package:core/navigation/i_route_manager.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:flutter/material.dart';



class CustomerHomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {

      case CrayonCustomerHomeScreen.viewPath :
          return  CrayonCustomerHomeScreen();
      default:
        throw UnimplementedError();
    }
  }
}
