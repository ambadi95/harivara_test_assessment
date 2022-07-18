import 'package:core/retrievers/data_models/app_type.dart';

class AppInfo {
  final AppType appType;
  final String? appVersion;

  AppInfo({
    required this.appType,
    this.appVersion,
  });
}
