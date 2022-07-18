import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_manager/utils/connectivity/connectivity_listener.dart';
import 'package:network_manager/utils/connectivity/internet_address_wrapper.dart';

import '../../fake_models/fake_storage.dart';
import '../../fake_models/fake_stream.dart';
import 'connectivity_listener_test.mocks.dart';

@GenerateMocks([Connectivity])
@GenerateMocks([InternetAddressWrapper])
void main() async {
  // global test usages
  final connectivity = MockConnectivity();
  final internetAddressWrapper = MockInternetAddressWrapper();
  final connectionChangeController = StreamController<bool>.broadcast();
  setUpAll(() {
    final iStorageService = MockIStorageService();
    DIContainer.container.registerSingleton<IStorageService>(
      (container) => iStorageService,
    );
  });
  tearDownAll(() {
    DIContainer.container.unregister<IStorageService>();
  });
  test(
    'when we get connectionChange before initialising the class, the method'
    'will throw an exception.',
    () async {
      // arrange

      final connectivityListener = ConnectivityListener(
        connectivity,
        connectionChangeController,
        internetAddressWrapper,
      );

      // act
      // assert
      expect(
        () => connectivityListener.connectionChange,
        throwsA(
          isInstanceOf<Exception>(),
        ),
      );
    },
  );

  test(
    'when we initialise we can get connectionChange without any errors'
    ' occurring',
    () async {
      // arrange
      // prepare connectivity changed on connectivity
      when(connectivity.onConnectivityChanged)
          .thenAnswer((_) => FakeStream<ConnectivityResult>());
      when(internetAddressWrapper.lookup(any))
          .thenAnswer((_) => Future(() => []));
      final connectivityListener = ConnectivityListener(
        connectivity,
        connectionChangeController,
        internetAddressWrapper,
      );

      // act
      await connectivityListener.initialize();
      final result = connectivityListener.connectionChange;
      // assert
      expect(
        result,
        isNot(null),
      );
    },
  );

  test(
    'when we call checkConnection and the application does not have access'
    'to the internet, it will return false',
    () async {
      // arrange
      // prepare connectivity changed on connectivity
      when(connectivity.onConnectivityChanged)
          .thenAnswer((_) => FakeStream<ConnectivityResult>());
      when(internetAddressWrapper.lookup(any))
          .thenAnswer((_) => Future(() => []));
      final connectivityListener = ConnectivityListener(
        connectivity,
        connectionChangeController,
        internetAddressWrapper,
      );

      // act
      final result = await connectivityListener.checkConnection();
      // assert
      expect(result, false);
    },
  );

  test(
    'when we call checkConnection and the application does have access'
    'to the internet, it will return true',
    () async {
      // arrange
      // prepare connectivity changed on connectivity
      when(connectivity.onConnectivityChanged)
          .thenAnswer((_) => FakeStream<ConnectivityResult>());
      when(internetAddressWrapper.lookup(any))
          .thenAnswer((_) => Future(() => [InternetAddress('1.1.1.1')]));
      final connectivityListener = ConnectivityListener(
        connectivity,
        connectionChangeController,
        internetAddressWrapper,
      );

      // act
      final result = await connectivityListener.checkConnection();
      // assert
      expect(result, true);
      await connectionChangeController.close();
    },
  );
}
