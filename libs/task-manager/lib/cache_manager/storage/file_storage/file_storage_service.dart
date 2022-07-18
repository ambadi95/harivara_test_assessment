import 'dart:io';

abstract class FileStorageService {
  Future<File> getFile(String fileName);
  Future deleteFile(String fileName);
  Future<File> createFile(String fileName, {required String content});
  Future<File> appendToFile(String fileName, {required String content});
  Future deleteAll();
}
