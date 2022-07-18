abstract class StorageService {
  /// Retrieves a string from a storage medium by using a [key].
  dynamic get(String key);

  /// Sets the [value] of a [key] in a storage medium.
  dynamic set(
      String key,
      dynamic value,
      );

  /// Deletes the content of a [key] in a storage medium.
  dynamic delete(String key);

  /// Deletes all content of a storage medium.
  dynamic deleteAll();
}

abstract class IStorageService {
  //abstract class for save/read values using TaskManager
  Future<String> getValueFromSecureStorage(String key,
      {String defaultValue = ''});

  Future<void> setValueToSecureStorage(Map<String, dynamic> keyValueMap);

  Future<String> getValueFromMemory(String key, {String defaultValue = ''});

  Future<void> setValueToMemory(Map<String, dynamic> keyValueMap);
}
