import 'package:core/storage/storage_service.dart';
import 'package:task_manager/task_manager.dart';

class CrayonPaymentStorageService implements IStorageService {
  final TaskManager _taskManager;
  CrayonPaymentStorageService(
    this._taskManager,
  );

  @override
  Future<String> getValueFromSecureStorage(String key,
      {String defaultValue = ''}) async {
    final mapData = await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SECURE_GET,
          DATA_KEY: [key]
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return mapData[key] as String? ?? defaultValue;
  }

  @override
  Future<void> setValueToSecureStorage(Map<String, dynamic> keyValueMap) async {
    await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SECURE_SET,
          DATA_KEY: keyValueMap,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return;
  }

  @override
  Future<String> getValueFromMemory(String key,
      {String defaultValue = ''}) async {
    final mapData = await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_GET,
          DATA_KEY: [key]
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return mapData[key] as String? ?? defaultValue;
  }

  @override
  Future<void> setValueToMemory(Map<String, dynamic> keyValueMap) async {
    await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_SET,
          DATA_KEY: keyValueMap,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return;
  }
}
