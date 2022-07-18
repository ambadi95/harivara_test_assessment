import 'dart:async';

import 'package:core/environment/environment_resolver.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/utils/extensions/iterable_extensions.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/graphql/network_graphql_response.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:network_manager/network_manager.dart';
import 'package:task_manager/cache_task_resolver.dart';
import 'package:task_manager/stream_observer/data_change_observer_resolver.dart';
import 'package:uuid/uuid.dart';

import 'module_resolver.dart';
import 'task.dart';

class TaskManager {
  bool _isShowing = false;
  final _runningNetworkRequests = <String>[];

  Future<dynamic> execute(Task task) {
    switch (task.taskType) {
      case TaskType.DATA_OPERATION:
        return executeDataRequest(task);

      case TaskType.PROGRESS_INDICATOR:
      case TaskType.IDENTITY_VERIFICATION:
      case TaskType.ANALYTICS:
      case TaskType.LOG:
      case TaskType.USER_SESSION:
        return _executeTask(task);

      case TaskType.ENVIRONMENT:
        return _executeEnvironmentTask(task.requestData);

      case TaskType.CACHE_OPERATION:
        return _executeLocalCacheTask(requestData: task.requestData);

      case TaskType.DATA_NOTIFIER:
        return _executeDataNotifierTask(task.requestData);

      case TaskType.APP_LAUNCH_DATA_OPERATION:
        if (task.requestData.containsKey(DATA_TASK_LIST)) {
          final tasksList = task.requestData[DATA_TASK_LIST] as List<Task>?;
          if (tasksList != null) {
            return _executeAppLaunchDataOperation(tasksList);
          }
        }
        throw Exception('There is no ${task.taskType} implemented');

      default:
        throw Exception('There is no ${task.taskType} implemented');
    }
  }

  Future<dynamic> executeDataRequest(Task task) {
    switch (task.subType) {
      case TaskSubType.REST:
        return _executeTask(task);
      case TaskSubType.GRAPHQL:
        return _executeGraphQLNetworkOnlyTask(task);
      default:
        throw Exception('There is no ${task.taskType} implemented');
    }
  }

  Future<dynamic> _executeDataNotifierTask(
      Map<String, dynamic> requestData,
      ) async {
    return await DIContainer.container<DataChangeObserverTaskResolver>()
        .execute('', requestData);
  }

  Future<dynamic> _executeLocalCacheTask({
    required Map<String, dynamic> requestData,
  }) async {
    final result = await DIContainer.container<CacheTaskResolver>()
        .execute('', requestData);

    // Notify the data observers when the cached data is cleaned up
    final cacheType = requestData[CACHE_TYPE] as TaskManagerCacheType;
    if (cacheType == TaskManagerCacheType.MEMORY_CLEAR) {
      await _executeDataNotifierTask(
        {
          DATA_KEY: [requestData[DATA_KEY]],
          DATA_NOTIFIER_TYPE_KEY: DataNotifierTaskType.SET,
        },
      );
    }
    return result;
  }

  Future<dynamic> _executeEnvironmentTask(
      Map<String, dynamic> requestData,
      ) async {
    return await DIContainer.container<EnvironmentResolver>()
        .loadEnvironment(requestData['environment'] as String? ?? '');
  }

  Future<NetworkStandardResponse> _executeTask(Task task) async {
    final request = await _executeStandardTask(task);

    // Make the network call
    final client = DIContainer.container<INetworkClient>(
      NetworkManager.networkClientKey,
    );
    final response = await client.standardRequest(request);
    return response;
  }

  Future<StandardRequest> _executeStandardTask(Task task) async {
    final taskResolver =
    ModuleResolver.getTaskResolver(task.moduleIdentifier, task.taskType);
    final apiIdentifier = task.apiIdentifier;
    final requestData = task.requestData;
    final request = await taskResolver!.execute(
      apiIdentifier,
      requestData,
    ) as StandardRequest;

    return request;
  }

  Future<NetworkGraphQLResponse> _executeGraphQLNetworkOnlyTask(
      Task task,
      ) async {
    final request = await _request(task);

    final cachedResult = await _inCache(task, request.cachePolicy);
    if (cachedResult != null) {
      return cachedResult;
    }

    return await _runGraphQLRequest(request, task);
  }

  Future<NetworkGraphQLResponse> _runGraphQLRequest(
      GraphQLRequest request,
      Task task,
      ) async {
    try {
      _shouldDisplayBusyModal(request);

      if (request.type == GraphQlRequestType.mutate) {
        request.additionalHeaders?.addAll({'x-idempotency-key': Uuid().v4()});
      }

      // Make the network call
      final client = DIContainer.container<INetworkClient>(
        NetworkManager.networkClientKey,
      );
      final response = await client.graphQLRequest(request);

      // Save to Cache
      await _saveToCache(task.apiIdentifier, response, request.cachePolicy);

      // Return the value
      return response;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      _shouldHideBusyModal(request);
    }
  }

  Future<GraphQLRequest> _request(Task task) async {
    final taskResolver =
    ModuleResolver.getTaskResolver(task.moduleIdentifier, task.taskType);
    final apiIdentifier = task.apiIdentifier;
    final requestData = task.requestData;
    final request = await taskResolver!.execute(
      apiIdentifier,
      requestData,
    ) as GraphQLRequest;

    return request;
  }

  Future<void> _executeAppLaunchDataOperation(List<Task> taskList) async {
    final List<Future<GraphQLRequest>> futureTasks = [];
    taskList.forEach(
          (task) {
        futureTasks.add(_request(task));
      },
    );

    final requestList = await Future.wait(futureTasks);

    var combinedQuery = 'query {';
    requestList.forEach((request) {
      combinedQuery += request.request;
    });

    combinedQuery += '}';

    // Make the network call
    final client = DIContainer.container<INetworkClient>(
      NetworkManager.networkClientKey,
    );

    final graphQLRequest = GraphQLRequest(
      combinedQuery,
      GraphQlRequestType.query,
      name: requestList.first.name,
      showBusy: true,
    );
    _shouldDisplayBusyModal(graphQLRequest);

    final response = await client.graphQLRequest(graphQLRequest);
    if (response.exception == null) {
      taskList.forEachIndexed((task, index) async {
        final request = requestList[index];
        final requestResponse = NetworkGraphQLResponse(
          data: response.data,
          exception: response.exception,
          message: response.message,
        );
        await _saveToCache(
          task.maskedApiIdentifier ?? '',
          requestResponse,
          request.cachePolicy,
        );
      });
    }

    _shouldHideBusyModal(graphQLRequest);
  }

  // ignore: unused_element
  Future _addDataObserver(Task task) async {
    await _executeDataNotifierTask(
      {
        DATA_KEY: [task.apiIdentifier],
        DATA_NOTIFIER_TYPE_KEY: DataNotifierTaskType.ADD,
        DATA_NOTIFIER_STREAM_CONTROLLER_KEY:
        task.requestData[DATA_NOTIFIER_STREAM_CONTROLLER_KEY],
      },
    );
  }

  Future<NetworkGraphQLResponse?> _inCache(
      Task task,
      CachePolicy cachePolicy,
      ) async {
    if (cachePolicy == CachePolicy.OnDemand) {
      final cachedResult = await _executeLocalCacheTask(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_GET,
          DATA_KEY: [task.apiIdentifier],
        },
      ) as Map<String, dynamic>;

      if (cachedResult.containsKey(task.apiIdentifier) &&
          cachedResult[task.apiIdentifier] != null) {
        final cachedNetworkResponse =
        cachedResult[task.apiIdentifier] as NetworkGraphQLResponse;
        return cachedNetworkResponse;
      }
    }

    return null;
  }

  Future<void> _saveToCache(
      String apiIdentifier,
      NetworkGraphQLResponse response,
      CachePolicy cachePolicy,
      ) async {
    if (cachePolicy == CachePolicy.OnDemand && !(response.hasException)) {
      await _executeLocalCacheTask(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_SET,
          DATA_KEY: {apiIdentifier: response},
        },
      );
    }
  }

  void _shouldDisplayBusyModal(GraphQLRequest request) {
    final currentRunningTaskCount = _runningNetworkRequests.isEmpty;

    _runningNetworkRequests.add(request.name);

    if (request.showBusy == true && currentRunningTaskCount && !_isShowing) {
      _isShowing = true;
      _showBusyModal(request.showBusyDelayInMilliseconds);
    }
  }

  void _showBusyModal(int delay) {
    final taskResolver =
    ModuleResolver.getTaskResolver('src', TaskType.PROGRESS_INDICATOR);
    taskResolver!.execute('busy_modal_show', {});
  }

  void _shouldHideBusyModal(GraphQLRequest request) {
    final index = _runningNetworkRequests.indexWhere(
          (element) =>
      element.toLowerCase().compareTo(request.name.toLowerCase()) == 0,
    );
    if (index != -1) {
      _runningNetworkRequests.removeAt(index);
      if (request.showBusy == true && _runningNetworkRequests.isEmpty) {
        _hideBusyModal();
      }
    }
    _isShowing = false;
  }

  void _hideBusyModal() {
    final taskResolver =
    ModuleResolver.getTaskResolver('src', TaskType.PROGRESS_INDICATOR);
    taskResolver!.execute('busy_modal_hide', {});
  }
}
