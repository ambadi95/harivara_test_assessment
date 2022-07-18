import 'package:device_info/device_info.dart';

abstract class DeviceInfoRetriever {
  Future<String> getDeviceModel(bool isIos);
}

class DeviceInfoRetrieverImpl implements DeviceInfoRetriever {
  @override
  Future<String> getDeviceModel(bool isIos) async {
    final deviceInfo = DeviceInfoPlugin();

    late String deviceAlias;

    if (isIos) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceAlias = iosInfo.model;
    } else {
      final androidInfo = await deviceInfo.androidInfo;
      deviceAlias = androidInfo.model;
    }
    return deviceAlias;
  }
}
