import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:core/retrievers/device_info_retriever.dart';
import 'package:core/retrievers/platform_retriever.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/model/requests/required_header/required_headers_generator.dart';
import 'package:core/retrievers/data_models/app_info.dart';

class MockPlatformRetriever extends Mock implements PlatformRetriever {}

class MockAppInfoRetriever extends Mock implements AppInfoRetriever {}

class MockDeviceInfoRetriever extends Mock implements DeviceInfoRetriever {}

class MockAppInfo extends Mock implements AppInfo {}

void main() {
  late PlatformRetriever platformRetriever;
  late AppInfoRetriever appInfoRetriever;
  late DeviceInfoRetriever deviceInfoRetriever;
  late RequiredHeadersGenerator requiredHeadersGenerator;
  late AppInfo appInfo;

  final appType = AppType.customer();
  final appVersion = '1.0.2';

  setUp(() {
    appInfo = MockAppInfo();
    when(() => appInfo.appType).thenReturn(appType);
    when(() => appInfo.appVersion).thenReturn(appVersion);
    platformRetriever = MockPlatformRetriever();
    appInfoRetriever = MockAppInfoRetriever();
    deviceInfoRetriever = MockDeviceInfoRetriever();
    requiredHeadersGenerator = RequiredHeadersGenerator(
      platformRetriever,
      appInfoRetriever,
      deviceInfoRetriever,
    );

    when(() => appInfoRetriever.getAppInfo).thenAnswer((_) async => appInfo);
  });

  group('returnRequiredHeaders general', () {
    const alias = 'alias';
    setUp(() {
      when(() => platformRetriever.isIos).thenReturn(true);
      when(() => deviceInfoRetriever.getDeviceModel(true))
          .thenAnswer((_) async => alias);
    });

    test('appName should be correct', () async {
      // Act
      final result = await requiredHeadersGenerator.returnRequiredHeaders();
      // Assert
      expect(result.appName, appType.toString());
    });

    test('appVersion should be correct', () async {
      // Act
      final result = await requiredHeadersGenerator.returnRequiredHeaders();
      // Assert
      expect(result.appVersion, appVersion);
    });

    test('deviceAlias should be correct', () async {
      // Act
      final result = await requiredHeadersGenerator.returnRequiredHeaders();
      // Assert
      expect(result.deviceAlias, alias);
    });
  });

  group('returnRequiredHeaders iOS', () {
    setUp(() {
      when(() => platformRetriever.isIos).thenReturn(true);
      when(() => deviceInfoRetriever.getDeviceModel(true))
          .thenAnswer((_) async => 'iPhone');
    });

    test('platform should be iOS', () async {
      // Act
      final result = await requiredHeadersGenerator.returnRequiredHeaders();
      // Assert
      expect(result.platform, 'iOS');
    });
  });

  group('returnRequiredHeaders Android', () {
    setUp(() {
      when(() => platformRetriever.isIos).thenReturn(false);
      when(() => deviceInfoRetriever.getDeviceModel(false))
          .thenAnswer((_) async => 'Android');
    });

    test('platform should be iOS', () async {
      // Act
      final result = await requiredHeadersGenerator.returnRequiredHeaders();
      // Assert
      expect(result.platform, 'Android');
    });
  });
}
