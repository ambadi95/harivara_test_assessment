import 'package:flutter/cupertino.dart';

class Language {
  final int id;
  final String flag;
  final String name;
  final Locale locale;

  Language(this.id, this.flag, this.name, this.locale);

  static List<Language> languageList() {
    return <Language>[
      // Language(1, "🇦🇫", "فارسی", "fa"),
      Language(1, '🇺🇸', 'English', Locale('en')),
      Language(2, '🇸🇦', 'اَلْعَرَبِيَّةُ', Locale('ar')),
      // Language(4, "🇮🇳", "हिंदी", "hi"),
    ];
  }
}
