//TODO: check this later

// import 'package:core/ioc/di_container.dart';
// import 'package:core/storage/storage_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task_manager/cache_manager/storage/unsecure_storage/unsecure_storage_service_impl.dart';
//
// import 'fake_storage.dart';
//
void main() {}
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   setUpAll(() {
//     final iStorageService = MockIStorageService();
//     DIContainer.container.registerSingleton<IStorageService>(
//       (container) => iStorageService,
//     );
//   });
//   tearDownAll(() {
//     DIContainer.container.unregister<IStorageService>();
//   });
//
//   test('get_value', () async {
//     //Arrange
//     final unsecureStorageService = UnsecureStorageServiceImpl();
//     final key = 'key1';
//     final value = 'Test Value';
//     SharedPreferences.setMockInitialValues({key: value});
//
//     //Act
//     final valueFromStorage = await unsecureStorageService.get(key);
//     final isEqual = value == valueFromStorage;
//     assert(true, isEqual);
//   });
//
//   test('set_value', () async {
//     //Arrange
//     final unsecureStorageService = UnsecureStorageServiceImpl();
//     final key = 'key1';
//     final value = 'Test Value';
//     SharedPreferences.setMockInitialValues({});
//
//     //Act
//     await unsecureStorageService.set(key, value);
//     final valueFromStorage = await unsecureStorageService.get(key);
//     final isEqual = value == valueFromStorage;
//     assert(true, isEqual);
//   });
//
//   test('delete_value', () async {
//     //Arrange
//     final unsecureStorageService = UnsecureStorageServiceImpl();
//     final key = 'key1';
//     final value = 'Test Value';
//     SharedPreferences.setMockInitialValues({key: value});
//
//     //Act
//     final prefs = await SharedPreferences.getInstance();
//     var exists = prefs.getKeys().isNotEmpty;
//     assert(true, exists);
//     await unsecureStorageService.delete(key);
//     var inexistent = prefs.getKeys().isEmpty;
//     assert(true, inexistent);
//   });
//
//   test('delete_all_values', () async {
//     //Arrange
//     final unsecureStorageService = UnsecureStorageServiceImpl();
//     SharedPreferences.setMockInitialValues({
//       'key1': 'value1',
//       'key2': 'value2',
//       'key3': 'value3',
//     });
//
//     //Act
//     final prefs = await SharedPreferences.getInstance();
//     var numKeys = prefs.getKeys().length;
//     var expectedNumKeys = numKeys == 3;
//     assert(true, expectedNumKeys);
//     await unsecureStorageService.deleteAll();
//     numKeys = prefs.getKeys().length;
//     expectedNumKeys = numKeys == 0;
//     assert(true, expectedNumKeys);
//   });
// }
