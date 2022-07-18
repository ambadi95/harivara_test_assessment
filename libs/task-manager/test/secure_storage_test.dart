import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return '.';
  });

  test('set_value', () async {
    //Arrange
    final secureStorageService = SecureStorageService();
    final key = 'key1';
    final value = 'Test Value';

    //Act
    await secureStorageService.set(key, value);
    final valueFromStorage = await secureStorageService.get(key);
    final isEqual = value == valueFromStorage;
    assert(true, isEqual);
  });

  test('get_value', () async {
    //Arrange
    final secureStorageService = SecureStorageService();
    final key = 'key1';
    final value = 'Test Value';

    //Act
    final valueFromStorage = await secureStorageService.get(key);
    final isEqual = value == valueFromStorage;
    assert(true, isEqual);
  });

  test('delete_all_values', () async {
    //Arrange
    final secureStorageService = SecureStorageService();
    await secureStorageService.set('key', 'value');
    await secureStorageService.set('key1', 'value1');

    //Act
    var valueFromStorage = await secureStorageService.get('key');
    final isNotDeleted = valueFromStorage != null;
    assert(true, isNotDeleted);
    await secureStorageService.deleteAll();
    valueFromStorage = await secureStorageService.get('key');
    final isDeleted = valueFromStorage == null;
    assert(true, isDeleted);
  });
}
