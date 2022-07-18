import 'package:task_manager/task_manager.dart';
import 'package:widget_library/miscellaneous/busy_modal/busy_modal_controller.dart';

class WidgetsProgressIndicatorTaskResolver implements TaskResolver {
  @override
  Future execute(String apiIdentifier, Map<String, dynamic> requestData) {
    switch (apiIdentifier) {
      case 'busy_modal_show':
        final delay = requestData[BusyModalController.delayArg] as int? ?? 0;
        return BusyModalController().show(delay);
      case 'busy_modal_hide':
        return BusyModalController().hide(requestData);

      default:
        throw TaskManagerException('The API Identifier "$apiIdentifier" does not match!');
    }
  }
}
