import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:termscondition/termscondition/view/terms_condition_view.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:termscondition/termscondition/view/terms_condition_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:config/Config.dart';

class LoanDetailNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  LoanDetailNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToTermsCondtionsScreen() async {
    var uri = Uri.parse(y9TermsCondition);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }

    /*  _navigationManager.navigateTo(
      CrayonTermsCondition.viewPath,
      const NavigationType.push(),
    );*/
  }
}
