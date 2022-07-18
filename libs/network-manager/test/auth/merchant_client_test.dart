import 'dart:async';

import 'package:core/ioc/di_container.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/merchant_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:network_manager/model/status/http_status.dart';
import 'package:shared_data_models/kyc/merchant_details_response.dart';
import '../fake_models/fake_storage.dart';

class MockUserManager extends Mock implements IUserManager {}

class MockNetworkStandardResponse extends Mock
    implements NetworkStandardResponse {}

class MockStandardRequest extends Mock implements StandardRequest {}

class MockINetworkClient extends Mock implements INetworkClient {}

void main() {
  late MockINetworkClient networkClient;
  final MockUserManager userManager = MockUserManager();
  late MockStandardRequest standardRequest;

  setUpAll(() {
    networkClient = MockINetworkClient();
    standardRequest = MockStandardRequest();
    when(() => standardRequest.requestType).thenReturn(RequestType.GET);
    when(() => standardRequest.endpoint)
        .thenReturn('merchant/merchants/v2.0/merchant/7700000000');
    when(() => standardRequest.customHeaders).thenReturn({
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    });
    when(() => userManager.getUserMobile())
        .thenAnswer((_) async => '7700000000');
    registerFallbackValue(
      StandardRequest(),
    );
    final iStorageService = MockIStorageService();
    DIContainer.container.registerSingleton<IStorageService>(
      (container) => iStorageService,
    );
  });

  tearDownAll(() {
    DIContainer.container.unregister<IStorageService>();
  });
  test(
    'when we call get merchant information '
    'application has connection to the internet and the network '
    'returns a successful response the result merchant model.',
    () async {
      final response = NetworkStandardResponse(
        '''{
              "merchantId": "50000022",
              "mobileNo": "987652222",
              "email": "carrefour@yopmail.com",
              "companyName": "Carrefour - The Line",
              "companyType": "Carrefour - The Line",
              "registrationNo": "1234567899",
              "registrationExpiry": null,
              "trVolume": {
                "key": "",
                "value": "SAR 5,001 - SAR 10,000"
              },
              "trValue": {
                "key": "",
                "value": "1,001 - 5,000"
              },
              "address": null,
              "management": [
                "Siddharth"
              ],
              "emailVerified": true,
              "status": true,
              "picByte": null,
              "businessCategory": {
                "key": "",
                "value": "Personal and Professional Services"
              },
              "applicationId": "30000000492"
         }''',
        HttpStatus.ok,
        <String, String>{},
      );

      final merchantClient = MerchantClient(
        networkClient,
        userManager,
      );

      var completer = Completer<void>();
      var future = completer.future;
      when(() => userManager.setUserId(any())).thenAnswer((_) {
        return future;
      });
      when(() => userManager.setWalletId(any())).thenAnswer((_) => future);
      when(() => userManager.setUserMobile(any())).thenAnswer((_) => future);
      when(() => userManager.setUserName(any())).thenAnswer((_) => future);
      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return 'error';
      };
      // act
      final result = await merchantClient.getUserInformation(
        callback,
      );
      expect(result, isA<MerchantResponse>());
    },
  );

  test(
    'when we call get merchant information '
    'application has connection to the internet and the network '
    'returns a not found response the result is error.',
    () async {
      final response = NetworkStandardResponse(
        '',
        HttpStatus.notFound,
        <String, String>{},
      );

      final merchantClient = MerchantClient(
        networkClient,
        userManager,
      );

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return error;
      };
      // act
      final result = await merchantClient.getUserInformation(
        callback,
      );
      expect(result, HttpStatus.notFound.toString());
    },
  );
}
