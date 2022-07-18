import 'package:task_manager/task_manager.dart';

abstract class ModuleResolver {
  static final Map<String, ModuleResolver> _resolverMap =
      <String, ModuleResolver>{};

  static void registerResolver(
    String moduleIdentifier,
    ModuleResolver resolver,
  ) {
    _resolverMap.putIfAbsent(moduleIdentifier, () => resolver);
  }

  static void unRegisterResolver(String moduleIdentifier) {
    _resolverMap.remove(moduleIdentifier);
  }

  static TaskResolver? getTaskResolver(String moduleIdentifier, TaskType type) {
    final moduleResolver = _resolverMap[moduleIdentifier];
    if (moduleResolver != null) {
      return moduleResolver.taskResolver(type);
    } else {
      throw Exception(
        'ModuleIdentifier of $moduleIdentifier is not present in _resolverMap of ${_resolverMap.keys}',
      );
    }
  }

  TaskResolver taskResolver(TaskType type);
}
