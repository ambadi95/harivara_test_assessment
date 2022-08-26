import 'dart:ui';

import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_faq_screen_args.dart';
import 'package:termscondition/termscondition/view/terms_condition_view.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:get/get.dart';
class KycCreditMainNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  KycCreditMainNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> navigateToCreditCheck() async {
    var arguments
       =  KycScreenArgs(
        KycFieldType.KYC_VALIDATION,
        "",
        "",
        "",
        "",
        [KYCDataModel(title: "", isSelected: false)],
      );

    await _navigationManager.navigateTo(
      KycCreditScreen.viewPath,
      const NavigationType.push(),
      arguments: arguments,
    );
  }

  Future<void> navigateToTermsCondtionsScreen() async {
    var arguments = TermsConditionAndFaqScreenArgs(isFAQ: false);
    _navigationManager.navigateTo(
        CrayonTermsCondition.viewPath,
        const NavigationType.push(),arguments: arguments);

  }



  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> showCheckBoxErrorBottomSheet(Widget widget, BuildContext context) async {
    showModalBottomSheet(
        barrierColor: const Color(0xFF9B9B9B).withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(height: Get.height * 0.35, child: widget),
            ),
          );
        });
  }

}