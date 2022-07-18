import 'package:core/retrievers/data_models/app_info.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[AppInfo] - constructor -', () {
    test('should have right values [1]', () {
      // Arrange
      final appInfo = AppInfo(
        appType: AppType.customer(),
        appVersion: '1.2.0',
      );

      // Assert
      expect(appInfo.appType, isA<CustomerApp>());
      expect(appInfo.appVersion, '1.2.0');
    });

    test('should have right values [1]', () {
      // Arrange
      final appInfo = AppInfo(
        appType: AppType.merchant(),
        appVersion: '2.2.0',
      );

      // Assert
      expect(appInfo.appType, isA<MerchantApp>());
      expect(appInfo.appVersion, '2.2.0');
    });
  });
}
