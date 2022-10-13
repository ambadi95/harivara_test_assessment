import 'dart:ui';

import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:get/get.dart';
import 'package:config/Config.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class DownPaymentNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DownPaymentNavigationHandler(this._navigationManager);

  Future<void> navigateToScanQrCode(int? deviceId, String modelName) async {
    var arguments = ScanQRCodeArgs(deviceId!, modelName);
    _navigationManager.navigateTo(
        ScanQrCodeScreen.viewPath,
        const NavigationType.push(),
        arguments: arguments
        );
  }
  Future<void> pop() async {
    _navigationManager.goBack();
  }

  Future<void> goBack() async {
    var args = HomeScreenArgs(userType: UserType.Agent, isAgent: true);
    _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: args);
  }
  Future<void> showErrorBottomSheet(
      Widget widget, BuildContext context,) async {
    showModalBottomSheet(
        barrierColor: const Color(0xFF9B9B9B).withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: MediaQuery.of(context).size.height * .55,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(height: Get.height * 0.45, child: widget),
            ),
          );
        });
  }

  Future<void> navigateToPaymentFailureBottomSheet() async {
    final CrayonPaymentBottomSheetIcon icon =
    //CrayonPaymentBottomSheetExclamatoryIcon();
    CrayonPaymentBottomSheetWarningYellowIcon();
    final CrayonPaymentBottomSheetState infoState =
    CrayonPaymentBottomSheetState.infoState(
      buttonOptions: [
        ButtonOptions(Black, 'PF_back_to_payment.tr', () {
          pop();
          pop();
          pop();
        }, false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      additionalText: ['PF_customer_support'.tr],
      title: 'PF_title'.tr,
      subtitle: "PF_desc".tr,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }



  Future<void> navigateToFinalSuccess() async {
    var argument = "test";
    await _navigationManager.navigateTo(
        SuccessScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }
}
