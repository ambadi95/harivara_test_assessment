import 'package:task_manager/task_manager.dart';
import 'package:widget_library/task_manager/widgets_progress_indicator_resolver.dart';

class WidgetsModuleResolver implements ModuleResolver {
  static const moduleIdentifier = 'src';

  @override
  TaskResolver taskResolver(TaskType type) {
    switch (type) {
      case TaskType.PROGRESS_INDICATOR:
        return WidgetsProgressIndicatorTaskResolver();

      default:
        // TODO: implement taskResolver
        throw UnimplementedError();
    }
  }
}
