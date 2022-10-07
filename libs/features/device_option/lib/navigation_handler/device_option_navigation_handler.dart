import 'dart:ui';
import 'package:get/get.dart';

import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:device_option/sub_features/device_loan_creation/view/device_loan_creation_screen.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:shared_data_models/deviceloancreation/devicecreation_screen_args.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:other_payment/view/other_payment_screen.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import '../sub_features/device_details/view/device_detail_screen.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';
import 'package:shared_data_models/downpayment/downpayment_data_model.dart';
import 'package:downpayment/view/down_payment_screen.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';

class DeviceOptionNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DeviceOptionNavigationHandler(this._navigationManager);

  Future<void> navigateToDeviceDetail(
      int id, UserType userType, bool isSelected) async {
    var arguments = {'userType': userType, 'id': id, 'isSelected': isSelected};
    await _navigationManager.navigateTo(
        DeviceDetailScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToDeviceLoanCreation(
      String image, Data deviceDetailData) async {
    var arguments = DeviceLoanCreationArgs(deviceDetailData, image);
    await _navigationManager.navigateTo(
        DeviceLoanCreationScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToCustomerEnrollmentScreen(
      String destinationPath, UserType userType) async {
    var argument = userType;
    _navigationManager.navigateTo(
        EnrollmentSuccessScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  navigateToDownPaymentScreen(String amount, int? deviceId, String modelName, bool isOutOfStock,bool isBottomSheetShow) {
    var arguments = DownPaymentScreenArgs(
        deviceId ?? 1, amount, "", "", modelName, 0, 0, 0, 0, 0,isOutOfStock,isBottomSheetShow );
    // var arguments = deviceId;
    _navigationManager.navigateTo(
        DownPaymentScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToOtherPaymentScreen(
      int deviceId, String modelName, double amount, String image, bool isOutOfStock, bool isBottomSheetShown) async {
    var arguments = OtherPaymentScreenArgs(
        deviceId, modelName, amount.toString(), '', '', 0, 0, image,isOutOfStock,isBottomSheetShown);
    await _navigationManager.navigateTo(
        OtherPaymentScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToStockAvailability(String message) async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetStockLogo();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.infoState(
      buttonOptions: [
        ButtonOptions(Black, "DLC_stock_available", () => goBack(), false),
        ButtonOptions(Black, "Close", () => goBack(), false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      subtitle: message,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
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



  Future<void> navigateToAgentHomeScreen() async {
    var args = HomeScreenArgs(userType: UserType.Agent, isAgent: true);
    _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: args);
  }

}
