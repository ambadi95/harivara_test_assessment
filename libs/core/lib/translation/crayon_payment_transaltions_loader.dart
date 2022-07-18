import 'dart:convert';

import 'package:flutter/services.dart';

abstract class CrayonPaymentTranslationsLoader {
  Future<Map<String, String>> getLocalJsonAssetAsMap(String path);
}

class CrayonPaymentTranslationsLoaderImpl implements CrayonPaymentTranslationsLoader {
  @override
  Future<Map<String, String>> getLocalJsonAssetAsMap(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final res = json.decode(jsonString) as Map<String, dynamic>;
    final jsonMap = Map<String, String>.from(res);
    return jsonMap;
  }
}
