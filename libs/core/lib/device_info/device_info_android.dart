import 'device_information.dart';

class DeviceInfoAndroid extends DeviceInformation {
  @override
  double getFontSize(double systemFontScale, double fontSize) {
    if (systemFontScale > 1.2) {
      return fontSize * systemFontScale * 0.600;
    } else if (systemFontScale > 1) {
      return fontSize * systemFontScale * 0.650;
    } else if (systemFontScale > 0.9) {
      return fontSize * systemFontScale * 0.650;
    } else if (systemFontScale > 0.8) {
      return fontSize * systemFontScale * 0.850;
    }
    return fontSize;
  }
}
