import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';

class CrayonPaymentTranslations extends Translations {
  final CrayonPaymentTranslationsLoader _translationsLoader;

  CrayonPaymentTranslations(this._translationsLoader);

  final List<Locale> _supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  final Map<String, Map<String, String>> _translationsMap = {};

  Future<void> loadTranslationFiles() async {
    for (var locale in _supportedLocales) {
      final langCode = locale.languageCode;
      final path = 'assets/lang/${langCode}.json';
      final jsonMap = await _translationsLoader.getLocalJsonAssetAsMap(path);
      _translationsMap.addAll({langCode: jsonMap});
      await initializeDateFormatting(langCode);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => _translationsMap;
}
