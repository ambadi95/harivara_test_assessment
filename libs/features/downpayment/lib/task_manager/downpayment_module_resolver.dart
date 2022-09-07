import 'package:task_manager/api_task_resolver.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task.dart';

class DownPaymentModuleResolver extends ModuleResolver {
  final TaskResolver _dataOperationTaskResolver;

  DownPaymentModuleResolver(this._dataOperationTaskResolver);

  @override
  TaskResolver taskResolver(TaskType type) {
    switch (type) {
      case TaskType.DATA_OPERATION:
        return _dataOperationTaskResolver;
      default:
        throw UnimplementedError();
    }
  }
}
