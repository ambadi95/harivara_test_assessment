import 'dart:async';

import 'package:core/ioc/di_container.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/customer_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:network_manager/model/status/http_status.dart';
import 'package:shared_data_models/customer/customer_model.dart';

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
        .thenReturn('customer/customers/v2.0/customer/7700000001');
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
    'when we call get customer information '
    'application has connection to the internet and the network '
    'returns a successful response the result customer model.',
    () async {
      final response = NetworkStandardResponse(
        '''{
        "customerId": "10000000001",
        "iban": "SA9030100999100000000123",
        "email": "lotfrlo@gmail.com",
        "firstName": "Arabic Fname",
        "lastName": "Arabic Lname",
        "englishFirstName": "John",
        "englishLastName": "Deo",
        "fatherName": "John",
        "grandFatherName": "John",
        "dateOfBirth": "12-12-1985",
        "dateType": "Gregorian",
        "gender": "M",
        "sourceOfIncome": "3",
        "iqamaId": "1122334459",
        "idExpiryDate": "12-12-2030",
        "idIssuePlace": "KSA",
        "sponsorName": "XYZ Company",
        "nationalityCode": "SA",
        "nationalityName": "SAUDI ARABIA",
        "salaryRangeId": "1",
        "salaryRange": "1.00 - 1000.00 SAR",
        "employmentStatus": "1",
        "walletId": "12341234",
        "address": "tamil nadu",
        "sourceOfWealth": "1",
        "sourceOfFunds": "4"}''',
        HttpStatus.ok,
        <String, String>{},
      );

      final customerClient = CustomerClient(
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
      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return 'error';
      };
      // act
      final result = await customerClient.getUserInformation(
        callback,
      );
      expect(result, isA<CustomerModel>());
    },
  );

  test(
    'when we call get customer information '
    'application has connection to the internet and the network '
    'returns a not found response the result is error.',
    () async {
      final response = NetworkStandardResponse(
        '',
        HttpStatus.notFound,
        <String, String>{},
      );

      final customerClient = CustomerClient(
        networkClient,
        userManager,
      );

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return error;
      };
      // act
      final result = await customerClient.getUserInformation(
        callback,
      );
      expect(result, HttpStatus.notFound.toString());
    },
  );
}
