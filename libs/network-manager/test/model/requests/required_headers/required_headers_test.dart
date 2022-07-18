import 'package:flutter_test/flutter_test.dart';
import 'package:network_manager/model/requests/required_header/required_headers.dart';

void main() {
  setUp(() {});

  group('toJson', () {
    test('toJson should return correct map', () async {
      // Arrange
      final requiredHeaders = RequiredHeaders(
        deviceAlias: 'deviceAlias',
        appName: 'appName',
        appVersion: 'appVersion',
        platform: 'platform',
        clientIp: 'clientIp',
        userAgent: 'userAgent',
      );
      // Act
      final result = requiredHeaders.toJson();
      // Assert
      expect(
        result[RequiredHeaders.HEADER_DEVICE_ALIAS],
        requiredHeaders.deviceAlias,
      );
      expect(
        result[RequiredHeaders.HEADER_APP_NAME],
        requiredHeaders.appName,
      );
      expect(
        result[RequiredHeaders.HEADER_APP_VERSION],
        requiredHeaders.appVersion,
      );
      expect(
        result[RequiredHeaders.HEADER_PLATFORM],
        requiredHeaders.platform,
      );
      expect(
        result[RequiredHeaders.HEADER_CLIENT_IP],
        requiredHeaders.clientIp,
      );
      expect(
        result[RequiredHeaders.HEADER_USER_AGENT],
        requiredHeaders.userAgent,
      );
    });
  });
}
