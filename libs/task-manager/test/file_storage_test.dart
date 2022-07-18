//TODO: fix permissions for getApplicationDocumentsDirectory

// import 'dart:io';
//
// import 'package:core/ioc/di_container.dart';
// import 'package:core/storage/storage_service.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:task_manager/cache_manager/storage/file_storage/file_storage_service_impl.dart';
//
// import 'fake_storage.dart';
//
void main() {}
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   const channel = MethodChannel('plugins.flutter.io/path_provider');
//   channel.setMockMethodCallHandler((MethodCall methodCall) async {
//     return '.';
//   });
//   setUpAll(() {
//     final iStorageService = MockIStorageService();
//     DIContainer.container.registerSingleton<IStorageService>(
//       (container) => iStorageService,
//     );
//   });
//   tearDownAll(() {
//     DIContainer.container.unregister<IStorageService>();
//   });
//   test('create_file', () async {
//     //Arrange
//     final fileStorageService = FileStorageServiceImpl();
//     final key = 'test_file';
//     final content = 'Test content';
//     final directory = await getApplicationDocumentsDirectory();
//     var filePath = directory.path + key + '.txt';
//
//     //Act
//     await fileStorageService.createFile(key, content: content);
//
//     final checkPathExistence = await Directory(filePath).exists();
//     assert(true, checkPathExistence);
//   });
//
//   test('get_file', () async {
//     //Arrange
//     final fileStorageService = FileStorageServiceImpl();
//     final key = 'test_file';
//     final content = 'Test content';
//
//     //Act
//     var file = await fileStorageService.getFile(key);
//     var fileContent = await file.readAsString();
//
//     final isEqual = fileContent == content;
//     assert(true, isEqual);
//   });
//
//   test('append_to_file', () async {
//     //Arrange
//     final fileStorageService = FileStorageServiceImpl();
//     final key = 'test_file';
//     final content = 'Test content';
//     final appendedContent = 'Appended content';
//
//     //Act
//     await fileStorageService.appendToFile(key, content: appendedContent);
//     var file = await fileStorageService.getFile(key);
//     var fileContent = await file.readAsString();
//
//     final isEqual = fileContent == (content + appendedContent);
//     assert(true, isEqual);
//   });
//
//   test('delete_file', () async {
//     //Arrange
//     final fileStorageService = FileStorageServiceImpl();
//     final key = 'test_file';
//     final directory = await getApplicationDocumentsDirectory();
//     var filePath = directory.path + key + '.txt';
//
//     //Act
//     await fileStorageService.deleteFile(key);
//
//     final checkPathExistence = !await Directory(filePath).exists();
//     assert(true, checkPathExistence);
//   });
//
//   test('delete_all_files', () async {
//     //Arrange
//     final fileStorageService = FileStorageServiceImpl();
//     final directory = await getApplicationDocumentsDirectory();
//
//     //Act
//     await fileStorageService.createFile('fileName1', content: 'content1');
//     await fileStorageService.createFile('fileName2', content: 'content2');
//     await fileStorageService.createFile('fileName3', content: 'content3');
//     await fileStorageService.deleteAll();
//
//     final inexistent = !(await Directory('$directory/local_files').exists());
//     assert(true, inexistent);
//   });
// }
