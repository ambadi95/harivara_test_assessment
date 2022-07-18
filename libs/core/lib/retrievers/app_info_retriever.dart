import 'package:core/retrievers/data_models/app_type.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'data_models/app_info.dart';

abstract class AppInfoRetriever {
  Future<AppInfo> get getAppInfo;

  AppType get appType;
}

class AppInfoRetrieverImpl implements AppInfoRetriever {
  final AppType _appType;

  AppInfoRetrieverImpl(this._appType);

  factory AppInfoRetrieverImpl.merchantApp() => AppInfoRetrieverImpl(
        AppType.merchant(),
      );

  factory AppInfoRetrieverImpl.customerApp() => AppInfoRetrieverImpl(
        AppType.customer(),
      );

  @override
  Future<AppInfo> get getAppInfo async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppInfo(
      appType: _appType,
      appVersion: packageInfo.version,
    );
  }

  @override
  AppType get appType => _appType;
}
