
import 'device_information.dart';

class DeviceInfoIos extends DeviceInformation {

  @override
  double getFontSize(double systemFontScale, double fontSize) {
    if (systemFontScale > 3) {
      return fontSize * systemFontScale * 0.150;
    } else if (systemFontScale > 2.5) {
      return fontSize * systemFontScale * 0.175;
    } else if (systemFontScale > 2) {
      return fontSize * systemFontScale * 0.210;
    } else if (systemFontScale > 1.8) {
      return fontSize * systemFontScale * 0.300;
    } else if (systemFontScale > 1.5) {
      return fontSize * systemFontScale * 0.411;
    } else if (systemFontScale > 1.3) {
      return fontSize * systemFontScale * 0.500;
    } else if (systemFontScale > 1.2) {
      return fontSize * systemFontScale * 0.540;
    } else if (systemFontScale > 1.1) {
      return fontSize * systemFontScale * 0.590;
    } else if (systemFontScale == 1.0) {
      return fontSize * systemFontScale * 0.650;
    } else if (systemFontScale > 0.9) {
      return fontSize * systemFontScale * 0.675;
    } else if (systemFontScale > 0.88) {
      return fontSize * systemFontScale * 0.710;
    } else if (systemFontScale > 0.82) {
      return fontSize * systemFontScale * 0.750;
    }
    return fontSize;
  }
}
