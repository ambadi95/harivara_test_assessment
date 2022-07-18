import 'dart:async';

import 'package:core/logging/logger.dart';
import 'package:core/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnsecureStorageServiceImpl extends StorageService {
  @override
  Future<bool> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var result = await prefs.remove(key);
    return result;
  }

  @override
  Future<bool> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    var result = await prefs.clear();
    return result;
  }

  @override
  Future<String?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    CrayonPaymentLogger.logInfo('Retrieved from storage: $value');
    return value;
  }

  @override
  Future set(
    String key,
    dynamic value,
  ) async {
    if (value is String?) {
      if (value == null) {
        CrayonPaymentLogger.logInfo('$key not saved to storage, value was null.');
        return;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      CrayonPaymentLogger.logInfo('Saved to storage: $value');
    } else {
      throw Exception(['Value isn\'t of type String?']);
    }
  }
}
