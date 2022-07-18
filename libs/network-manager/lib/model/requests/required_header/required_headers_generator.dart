import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/device_info_retriever.dart';
import 'package:core/retrievers/platform_retriever.dart';
import 'package:network_manager/model/requests/required_header/required_headers.dart';

class RequiredHeadersGenerator {
  final PlatformRetriever _platformRetriever;
  final AppInfoRetriever _appInfoRetriever;
  final DeviceInfoRetriever _deviceInfoRetriever;

  RequiredHeadersGenerator(
    this._platformRetriever,
    this._appInfoRetriever,
    this._deviceInfoRetriever,
  );

  Future<RequiredHeaders> returnRequiredHeaders() async {
    final isIos = _platformRetriever.isIos;
    final platform = isIos ? 'iOS' : 'Android';
    final appInfo = await _appInfoRetriever.getAppInfo;
    final deviceAlias = await _deviceInfoRetriever.getDeviceModel(isIos);

    // TODO: Further discussion needs to go into how to obtain the clientIp and userAgent
    return RequiredHeaders(
      deviceAlias: deviceAlias,
      appName: appInfo.appType.toString(),
      appVersion: appInfo.appVersion ?? '1.0.0',
      platform: platform,
      clientIp: 'clientIp',
      userAgent: 'userAgent',
    );
  }
}
