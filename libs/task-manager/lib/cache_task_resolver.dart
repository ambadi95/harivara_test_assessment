import 'dart:async';
import 'dart:io';

import 'package:core/logging/logger.dart';
import 'package:core/storage/storage_service.dart';
import 'package:task_manager/cache_manager/storage/file_storage/file_storage_service.dart';
import 'package:task_manager/task_manager.dart';

class _Constants {
  static final delayedCahedCall = 2;
}

class CacheTaskResolver implements TaskResolver {
  final StorageService secureStorageService;
  final FileStorageService fileStorageService;
  final StorageService unsecureStorageService;
  final StorageService memoryStorageService;

  CacheTaskResolver({
    required this.secureStorageService,
    required this.fileStorageService,
    required this.unsecureStorageService,
    required this.memoryStorageService,
  });

  @override
  Future execute(String apiIdentifier, Map<String, dynamic> requestData) async {
    final cacheType = requestData[CACHE_TYPE] as TaskManagerCacheType;

    switch (cacheType) {
      case TaskManagerCacheType.SET:
        await _setToStorage(requestData[DATA_KEY] as Map<String, dynamic>);
        break;
      case TaskManagerCacheType.GET:
        return await _getFromStorage(
          requestData[DATA_KEY] as Map<String, String?>,
        );
      case TaskManagerCacheType.CLEAR:
        await _clearFromStorage(requestData[DATA_KEY] as String);
        break;
      case TaskManagerCacheType.SECURE_SET:
        await _setToSecureStorage(
          requestData[DATA_KEY] as Map<String, dynamic>,
        );
        break;
      case TaskManagerCacheType.SECURE_GET:
        final key = requestData[DATA_KEY];
        if (key is String) {
          return await _getFromSecureStorageWithKey(key);
        } else if (key is List<String>) {
          return await _getFromSecureStorageWithKeys(key);
        } else if (key is Map<String, dynamic>) {
          return await _getFromSecureStorageWithKeyMap(key);
        } else {
          throw Exception(
            'The runtime type: ${key.runtimeType} is not supported.',
          );
        }
      case TaskManagerCacheType.MEMORY_SET:
        final data = requestData[DATA_KEY] as Map<String, dynamic>;
        _setToMemoryStorage(
          data,
        );
        // _notifyDataObserver(data);
        break;

      case TaskManagerCacheType.MEMORY_GET:
        final dataMap = await _getFromMemoryStorage(
          requestData[DATA_KEY] as List<String>,
        );
        return dataMap;

      case TaskManagerCacheType.MEMORY_CLEAR:
        var duration = _Constants.delayedCahedCall;
        if (requestData.containsKey('duration')) {
          duration =
              requestData['duration'] as int? ?? _Constants.delayedCahedCall;
        }
        await Future.delayed(Duration(seconds: duration), () {
          memoryStorageService.delete(
            requestData[DATA_KEY] as String,
          );
        });
        break;

      case TaskManagerCacheType.MEMORY_CLEAR_ALL:
        memoryStorageService.deleteAll();
        break;

      case TaskManagerCacheType.APPEND_TO_FILE:
        final dataMap = await _batchAppendToFiles(
          requestData[DATA_KEY] as Map<String, String?>,
        );
        return dataMap;
      case TaskManagerCacheType.WRITE_FILE:
        final dataMap = await _batchCreateFiles(
          requestData[DATA_KEY] as Map<String, String?>,
        );
        return dataMap;
      case TaskManagerCacheType.GET_FILE:
        final files =
        await _batchGetFiles(requestData[DATA_KEY] as Map<String, String?>);
        return files;
      case TaskManagerCacheType.DELETE_FILE:
        await _batchDeleteFiles(requestData[DATA_KEY] as Map<String, String?>);
        break;
      case TaskManagerCacheType.DELETE_ALL:
        await unsecureStorageService.deleteAll();
        await secureStorageService.deleteAll();
        await fileStorageService.deleteAll();
        memoryStorageService.deleteAll();
        break;

      default:
        throw UnimplementedError(
          'Error: [$CACHE_TYPE] not found, can only accept ${TaskManagerCacheType.values.toString()} types',
        );
    }
  }

  // Regular Storage

  Future _setToStorage(Map<String, dynamic> dataMap) async {
    final keys = dataMap.keys.toList();
    await Future.forEach(keys, (String key) async {
      var value = dataMap[key];
      await unsecureStorageService.set(
        key,
        value,
      );
    });
  }

  Future _clearFromStorage(String key) async {
    return unsecureStorageService.delete(
      key,
    );
  }

  Future<Map<String, String?>> _getFromStorage(
      Map<String, String?> dataMap,
      ) async {
    final keys = dataMap.keys.toList();
    final newMap = <String, String?>{};
    await Future.forEach(keys, (String key) async {
      var value = await unsecureStorageService.get(key);
      newMap[key] = value as String?;
    });
    return newMap;
  }

  // Secure Storage

  Future _setToSecureStorage(Map<String, dynamic> dataMap) async {
    await Future.forEach(dataMap.keys, (String key) async {
      final value = dataMap[key];
      if (value != null) {
        await secureStorageService.set(
          key,
          value,
        );
      } else {
        CrayonPaymentLogger.logError(
          'Unable to set $key in secure storage, value was null',
        );
      }
    });
  }

  Future<Map<String, String?>> _getFromSecureStorageWithKeys(
      List<String> keys,
      ) async {
    final newMap = <String, String?>{};
    await Future.forEach(keys, (String key) async {
      final result = await secureStorageService.get(key);
      newMap[key] = result as String?;
    });
    return newMap;
  }

  Future<Map<String, String?>> _getFromSecureStorageWithKeyMap(
      Map<String, dynamic> keys,
      ) async {
    final newMap = <String, String?>{};
    await Future.forEach(keys.entries, (MapEntry<String, dynamic> entry) async {
      final result = await secureStorageService.get(entry.value as String);
      newMap[entry.value as String] = result as String?;
    });
    return newMap;
  }

  Future<Map<String, String?>> _getFromSecureStorageWithKey(String key) async {
    final newMap = <String, String?>{};
    final result = await secureStorageService.get(key);
    newMap[key] = result as String?;
    return newMap;
  }

  // Memory Storage
  void _setToMemoryStorage(
      Map<String, dynamic> dataMap,
      ) {
    dataMap.keys.forEach((key) {
      final value = dataMap[key];
      if (value != null) {
        memoryStorageService.set(
          key,
          value,
        );
      }
    });
  }

  Future<Map<String, dynamic>> _getFromMemoryStorage(List<String> keys) async {
    final newMap = <String, dynamic>{};
    await Future.forEach(keys, (String key) async {
      final result = memoryStorageService.get(key);
      if (result != null) {
        newMap[key] = result;
      }
    });

    return newMap;
  }

  // Files
  Future<List<File>> _batchGetFiles(Map<String, String?> dataMap) async {
    var files = <File>[];
    await Future.forEach(
      dataMap.keys,
          (String key) async => files.add(await fileStorageService.getFile(key)),
    );
    return files;
  }

  Future _batchAppendToFiles(Map<String, String?> dataMap) async {
    await Future.forEach(
      dataMap.keys,
          (String key) async => await fileStorageService.createFile(
        key,
        content: dataMap[key] as String,
      ),
    );
  }

  Future _batchCreateFiles(Map<String, String?> dataMap) async {
    await Future.forEach(
      dataMap.keys,
          (String key) async => await fileStorageService.createFile(
        key,
        content: dataMap[key] as String,
      ),
    );
  }

  Future _batchDeleteFiles(Map<String, String?> dataMap) async {
    await Future.forEach(dataMap.keys, (String key) async {
      try {
        await fileStorageService.deleteFile(key);
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
