import 'package:flutter/material.dart';
import 'package:core/translation/app_localization.dart';
import 'package:core/translation/i_app_localization_service.dart';

class AppLocalizationService implements IAppLocalizationService {
  static late BuildContext context;

  @override
  String getValue(String key, {List<dynamic> args = const []}) {
    return AppLocalizations.of(AppLocalizationService.context)?.translate(key, args: args) ?? key;
  }
}
