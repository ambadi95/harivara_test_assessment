import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprintf/sprintf.dart';

List<String>? data = [];

class AppLocalizations {
  final Locale locale;
  static Map<String, String> packages = {};
  static List<String> localeList = [];

  AppLocalizations(this.locale);

  // Helper method to keep the code in the src concise
  // Localizations are accessed using an InheritedWidget "of" syntax

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate(localeList);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final _localizedStrings = <String, Map<String, String>>{};

  Future parsePackage(
      {required String shortName, required String packageName}) async {
    final path = 'assets/lang/${locale.languageCode}.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final stringValues = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    _localizedStrings[shortName] = stringValues;
  }

  Future<bool> load() async {
    await Future.forEach(packages.keys, (String key) async {
      await parsePackage(shortName: key, packageName: packages[key].toString());
    });
    return true;
  }

  String translate(String key, {List<dynamic> args = const []}) {
    final splitStrings = key.split(':');

    var message = key;

    if (splitStrings.length > 1) {
      final packageName = splitStrings.first;
      final stringKey = splitStrings.last;
      final stringsList = _localizedStrings[packageName];
      message = stringsList?[stringKey] ?? key;
    }
    if (args.isEmpty) {
      return message;
    } else {
      return sprintf(message, args);
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  List<String> localeList;
  _AppLocalizationsDelegate(this.localeList);

  @override
  bool isSupported(Locale locale) {
    return localeList.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
