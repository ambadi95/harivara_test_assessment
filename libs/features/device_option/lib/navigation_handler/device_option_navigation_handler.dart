import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

import '../sub_features/device_details/view/device_detail_screen.dart';

class DeviceOptionNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DeviceOptionNavigationHandler(this._navigationManager);

  Future<void> navigateToDeviceDetail(int id, UserType userType) async {
    var arguments = {
      'userType' : userType,
      'id' : id
    };
    await _navigationManager.navigateTo(
        DeviceDetailScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToCustomerEnrollmentScreen(
      String destinationPath, UserType userType) async {
    var argument = userType;
    _navigationManager.navigateTo(
        EnrollmentSuccessScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }
}
