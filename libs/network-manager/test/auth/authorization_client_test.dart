import 'dart:async';

import 'package:core/ioc/di_container.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/authorization_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:network_manager/model/response/token/token_response.dart';
import 'package:network_manager/model/status/http_status.dart';
import '../fake_models/fake_storage.dart';

class MockAuthManager extends Mock implements IAuthManager {}

class MockUserManager extends Mock implements IUserManager {}

class MockNetworkStandardResponse extends Mock
    implements NetworkStandardResponse {}

class MockStandardRequest extends Mock implements StandardRequest {}

class MockINetworkClient extends Mock implements INetworkClient {}

void main() {
  late MockINetworkClient networkClient;
  final MockAuthManager authManager = MockAuthManager();
  late MockUserManager userManager;
  late MockStandardRequest standardRequest;

  setUpAll(() {
    networkClient = MockINetworkClient();
    standardRequest = MockStandardRequest();
    userManager = MockUserManager();
    when(() => standardRequest.requestType).thenReturn(RequestType.GET);
    when(() => standardRequest.endpoint)
        .thenReturn('customer/customers/v2.0/customer/7740000000');
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
    'when we call get customer token information '
    'application has connection to the internet and the network '
    'returns a successful response the result token response model.',
    () async {
      final response = NetworkStandardResponse(
        '''{
        "token": "abed"}
        ''',
        HttpStatus.ok,
        <String, String>{},
      );

      final authClient = AuthorizationClient(
        'CUSTOMER',
        networkClient,
        authManager,
        userManager,
      );

      var completer = Completer<void>();
      var future = completer.future;
      when(() => authManager.storeTokenInformation(any(), any(), any(), any()))
          .thenAnswer((_) {
        return future;
      });

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return 'error';
      };
      // act
      final result = await authClient.requestToken(
        callback,
      );
      expect(result, isA<TokenResponse>());
    },
  );

  test(
    'when we call get customer token information '
    'application has connection to the internet and the network '
    'returns a not found response the result is error.',
    () async {
      final response = NetworkStandardResponse(
        '',
        HttpStatus.notFound,
        <String, String>{},
      );

      final authClient = AuthorizationClient(
        'CUSTOMER',
        networkClient,
        authManager,
        userManager,
      );

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      var apiError = '';
      Function(String) callback = (error) {
        apiError = error;
        return error;
      };
      // act
      await authClient.requestToken(
        callback,
      );
      expect(apiError, HttpStatus.notFound.toString());
    },
  );

  test(
    'when we call get agent token information '
    'application has connection to the internet and the network '
    'returns a successful response the result token response model.',
    () async {
      final response = NetworkStandardResponse(
        '''{
        "token": "abed"}
        ''',
        HttpStatus.ok,
        <String, String>{},
      );

      final authClient = AuthorizationClient(
        'MERCHANT',
        networkClient,
        authManager,
        userManager,
      );

      var completer = Completer<void>();
      var future = completer.future;
      when(() => authManager.storeTokenInformation(any(), any(), any(), any()))
          .thenAnswer((_) {
        return future;
      });

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      Function(String) callback = (error) {
        return 'error';
      };
      // act
      final result = await authClient.requestToken(
        callback,
      );
      expect(result, isA<TokenResponse?>());
    },
  );

  test(
    'when we call get agent token information '
    'application has connection to the internet and the network '
    'returns a not found response the result is error.',
    () async {
      final response = NetworkStandardResponse(
        '',
        HttpStatus.notFound,
        <String, String>{},
      );

      final authClient = AuthorizationClient(
        'MERCHANT',
        networkClient,
        authManager,
        userManager,
      );

      when(() => networkClient.standardRequest(any()))
          .thenAnswer((_) async => response);

      var apiError = '';
      Function(String) callback = (error) {
        apiError = error;
        return error;
      };
      // act
      await authClient.requestToken(
        callback,
      );
      expect(apiError, HttpStatus.notFound.toString());
    },
  );
}
