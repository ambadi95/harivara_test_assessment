import 'package:core/storage/storage_service.dart';

/// A mini-service for storing string-based values in memory.
class MemoryStorageServiceImpl implements StorageService {
  static final memoryStorage = <String, dynamic>{};

  @override
  dynamic get(String key) => memoryStorage[key];

  @override
  void set(
    String key,
    dynamic value,
  ) {
    memoryStorage[key] = value;
  }

  @override
  void deleteAll() {
    memoryStorage.clear();
  }

  @override
  void delete(String key) {
    memoryStorage.remove(key);
  }
}
