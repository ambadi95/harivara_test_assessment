import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

import '../sub_features/device_details/view/device_detail_screen.dart';

class DeviceOptionNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  DeviceOptionNavigationHandler(this._navigationManager);

  Future<void> navigateToDeviceDetail() async {
    await _navigationManager.navigateTo(
      DeviceDetailScreen.viewPath,
      const NavigationType.push(),
    );
  }

}
