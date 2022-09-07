import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:device_option/sub_features/device_loan_creation/view/device_loan_creation_screen.dart';
import 'package:shared_data_models/deviceloancreation/devicecreation_screen_args.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

import '../sub_features/device_details/view/device_detail_screen.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';

import 'package:shared_data_models/downpayment/downpayment_data_model.dart';
import 'package:downpayment/view/down_payment_screen.dart';

class DeviceOptionNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DeviceOptionNavigationHandler(this._navigationManager);

  Future<void> navigateToDeviceDetail(int id, UserType userType) async {
    var arguments = {'userType': userType, 'id': id};
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

  navigateToDownPaymentScreen(String amount,int? deviceId) {
    var arguments = DownPaymentScreenArgs(
        deviceId ?? 1, amount, "", "",0,0,0,0,0);
    // var arguments = deviceId;
    _navigationManager.navigateTo(
        DownPaymentScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }
}
