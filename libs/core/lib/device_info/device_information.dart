import 'dart:io';

import 'package:flutter/widgets.dart';

import 'device_info_android.dart';
import 'device_info_ios.dart';

abstract class DeviceInformation {
  DeviceInformation();

  factory DeviceInformation.factoryPlatformDeviceInfo() {
    if (Platform.isAndroid) {
      return DeviceInfoAndroid();
    } else if (Platform.isIOS) {
      return DeviceInfoIos();
    } else {
      throw FlutterError('DeviceInformation is only supporting IOS and Android');
    }
  }

  /// [systemFontScale] is the system's text scaling factor.
  /// To modify this, change the font size in accessibility settings
  /// [fontSize] is the custom font size given for the src
  double getFontSize(double systemFontScale, double fontSize);
}
