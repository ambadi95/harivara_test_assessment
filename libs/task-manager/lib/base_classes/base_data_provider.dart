import 'package:network_manager/model/response/graphql/network_graphql_response.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

class BaseDataProvider {
  final TaskManager _taskManager;

  BaseDataProvider(this._taskManager);

  Future<void> clearCache(String key, {int? duration}) async {
    var requestData = {
      CACHE_TYPE: TaskManagerCacheType.MEMORY_CLEAR,
      DATA_KEY: key,
    };
    if (duration != null) {
      requestData['duration'] = duration;
    }
    await _taskManager.execute(
      Task(requestData: requestData, taskType: TaskType.CACHE_OPERATION),
    );
  }

  Future<void> clearFromStorage(String key, {int? duration}) async {
    var requestData = {
      CACHE_TYPE: TaskManagerCacheType.CLEAR,
      DATA_KEY: key,
    };
    if (duration != null) {
      requestData['duration'] = duration;
    }
    await _taskManager.execute(
      Task(requestData: requestData, taskType: TaskType.CACHE_OPERATION),
    );
  }

  /// [modelBuilderCallback] is a callback function used to create the intended model
  /// on a successful call. Usually this is done with a factory method like:
  /// modelBuilder: (jsonMap) => LoginModel.fromJson(jsonMap)
  ///
  /// [moduleIdentifier] refers to the module, usually a const static eg:
  /// LoginModule.moduleIdentifier
  ///
  /// [serviceIdentifier] refers to the service used within that module,
  /// again usually a const static, eg:
  /// LoginService.serviceIdentifier
  ///
  /// [onError] is called whenever request is not successful. Returns a String.
  Future<T?> executeApiRequest<T>({
    String? serviceIdentifier,
    String? moduleIdentifier,
    Map<String, dynamic>? requestData,
    Function(String)? onError,
    required TaskType taskType,
    required TaskSubType taskSubType,
    required T Function(Map<String, dynamic> jsonData) modelBuilderCallback,
  }) async {
    final task = Task(
      moduleIdentifier: moduleIdentifier ?? '',
      apiIdentifier: serviceIdentifier ?? '',
      requestData: requestData ?? {},
      taskType: taskType,
      subType: taskSubType,
    );
    final result = await _taskManager.execute(task);
    return _handleResponse(result, modelBuilderCallback, onError) as T?;
  }

  dynamic _handleResponse(
    dynamic result,
    Function(Map<String, dynamic> jsonData) modelBuilderCallback,
    Function(String)? onError,
  ) {
    if (result is NetworkGraphQLResponse) {
      return _handleGraphQlResponse(result, modelBuilderCallback, onError);
    } else if (result is NetworkStandardResponse) {
      return _handleNetworkStandardResponse(
        result,
        modelBuilderCallback,
        onError,
      );
    }
  }

  dynamic _handleNetworkStandardResponse(
    NetworkStandardResponse standardResponse,
    Function(Map<String, dynamic> jsonData) modelBuilderCallback,
    Function(String)? onError,
  ) {
    return modelBuilderCallback(standardResponse.jsonResult!);
  }

  dynamic _handleGraphQlResponse(
    NetworkGraphQLResponse graphQLResponse,
    Function(Map<String, dynamic> jsonData) modelBuilderCallback,
    Function(String)? onError,
  ) {
    if (graphQLResponse.hasException) {
      onError?.call(graphQLResponse.errorCode!);
      return null;
    } else {
      return modelBuilderCallback(graphQLResponse.data!);
    }
  }

  Future<String> getValueFromMemory(
    String key, {
    String defaultValue = '',
  }) async {
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

  Future<bool> getBoolValueFromMemory(
    String key, {
    bool defaultValue = false,
  }) async {
    final mapData = await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_GET,
          DATA_KEY: [key]
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return mapData[key] as bool? ?? defaultValue;
  }

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

  Future<void> setValueToStorage(Map<String, dynamic> keyValueMap) async {
    await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SET,
          DATA_KEY: keyValueMap,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
  }

  Future<String> getValueFromStorage(
    String key, {
    String defaultValue = '',
  }) async {
    final mapData = await _taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.GET,
          DATA_KEY: {key: null}
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return mapData[key] as String? ?? defaultValue;
  }

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

  Future<String> getValueFromSecureStorage(
    String key, {
    String defaultValue = '',
  }) async {
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

  Future<Stream?> registerObservers(String key) async {
    var values = await _taskManager.execute(
      Task(
        requestData: {
          DATA_KEY: [key],
          DATA_NOTIFIER_TYPE_KEY: DataNotifierTaskType.ADD,
        },
        taskType: TaskType.DATA_NOTIFIER,
      ),
    );

    if (values != null && values[key] != null) {
      final _stream = values[key].stream;
      return _stream as Stream;
    }
    return null;
  }

  Future<Map<String, Stream?>> registerMultipleObservers(
    List<String> keys,
  ) async {
    var values = <String, Stream?>{};
    keys.forEach((key) async {
      final result = await _taskManager.execute(
        Task(
          requestData: {
            DATA_KEY: [key],
            DATA_NOTIFIER_TYPE_KEY: DataNotifierTaskType.ADD,
          },
          taskType: TaskType.DATA_NOTIFIER,
        ),
      );
      Stream? _stream;
      if (result != null && result[key] != null) {
        _stream = result[key].stream as Stream;
      }
      values[key] = _stream;
    });
    return values;
  }

  Future<void> unRegisterObservers(String key) async {
    await _taskManager.execute(
      Task(
        requestData: {
          DATA_NOTIFIER_TYPE_KEY: DataNotifierTaskType.DELETE,
          DATA_KEY: [key],
        },
        taskType: TaskType.DATA_NOTIFIER,
      ),
    );
  }
}
