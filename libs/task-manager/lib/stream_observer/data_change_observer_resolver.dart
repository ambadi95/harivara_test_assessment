import 'dart:async';

import 'package:task_manager/api_task_resolver.dart';
import 'package:core/utils/extensions/list_extensions.dart';
import 'package:task_manager/task.dart';

class DataChangeObserverTaskResolver implements TaskResolver {
  final _streamControllers = <String, StreamController>{};

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) async {
    final keys = requestData[DATA_KEY] as List<dynamic>?;
    final type = requestData[DATA_NOTIFIER_TYPE_KEY] as DataNotifierTaskType;
    if (keys.isNullOrEmpty()) {
      return Future.value();
    }

    switch (type) {
      case DataNotifierTaskType.ADD:
        var values = <String, StreamController>{};
        await Future.forEach(
          keys!,
          (dynamic key) async {
            final keyAsString = key as String;
            if (!(_streamControllers.containsKey(key))) {
              final newStreamController = StreamController();
              _streamControllers[keyAsString] = newStreamController;
              values[keyAsString] = newStreamController;
            } else {
              values[keyAsString] = _streamControllers[keyAsString]!;
            }
          },
        );

        return values;

      case DataNotifierTaskType.DELETE:
        await Future.forEach(
          keys!,
          (dynamic key) async {
            _closeStreamController(key);
          },
        );
        break;

      case DataNotifierTaskType.DELETE_ALL:
        await Future.forEach(
          keys!,
          (dynamic key) async {
            _closeStreamController(key);
          },
        );
        break;

      case DataNotifierTaskType.SET:
        await Future.forEach(
          keys!,
          (dynamic key) async {
            if (_streamControllers.containsKey(key)) {
              final element = _streamControllers[key];
              element!.add({
                DATA_NOTIFIER_STATUS_KEY: DataNotifierStatus.REFRESH,
                DATA_NOTIFIER_PARAM_KEY: requestData[DATA_NOTIFIER_PARAM_VALUES]
              });
            }
          },
        );
        break;

      default:
        // TODO: implement execute
        throw UnimplementedError();
    }
  }

  void _closeStreamController(dynamic key) {
    if (_streamControllers.containsKey(key)) {
      final streamController = _streamControllers[key];
      streamController?.close();
      _streamControllers.remove(key);
    }
  }
}
