library network_manager;

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/device_info_retriever.dart';
import 'package:core/retrievers/platform_retriever.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:core/storage/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/authorization_client.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/client/mock_network_client.dart';
import 'package:network_manager/client/network_client.dart';
import 'package:network_manager/model/requests/required_header/required_headers_generator.dart';
import 'package:network_manager/utils/connectivity/connectivity_listener.dart';
import 'package:network_manager/utils/connectivity/i_connectivity.dart';
import 'package:network_manager/utils/connectivity/internet_address_wrapper.dart';

import 'auth/user_manager.dart';
import 'global_control/global_control_notifier.dart';
import 'global_control/model/client_information/client_information.dart';
import 'global_control/model/configuration/config.dart';

/// A class to manage the initialisation of the [NetworkManager] module
class NetworkManager {
  // private keys for di
  static const _connectivityPluginKey = 'connectivity_plugin';

  // _connectivityListenerStreamDKey left here for future use
  // ignore: unused_field
  static const _connectivityListenerStreamDKey = 'connectivity_listener_stream';
  static const _internetAddressWrapperKey = 'internet_address_wrapper';

  // public keys for di
  static const globalControlNotifierKey = 'global_control_notifier';
  static const networkClientKey = 'network_client';

  /// Registers all of the dependencies for the network manager's dependency
  /// injection system.
  // ignore: long-method
  static void registerDependencies({bool useMockNetworkClient = false}) {
    // register connectivity listener + dependency tree
    DIContainer.container.registerSingleton(
      (c) => Connectivity(),
      name: _connectivityPluginKey,
    );

    DIContainer.container.registerInstance(
      InternetAddressWrapper(),
      name: _internetAddressWrapperKey,
    );

    DIContainer.container.registerSingleton<IConnectivity>(
      (c) => ConnectivityListener(
        c.resolve(_connectivityPluginKey),
        StreamController.broadcast(),
        c.resolve(_internetAddressWrapperKey),
      ),
      //name: connectivityListenerKey,
    );

    // register auth manager
    final secureStorage = DIContainer.container<StorageService>();
    secureStorage.delete('refresh_token');
    DIContainer.container.registerSingleton<IAuthManager>(
      (container) => CrayonPaymentAuthManager(secureStorage as SecureStorageService),
    );

    // register user manager
    DIContainer.container.registerSingleton<IUserManager>(
      (container) => UserManager(secureStorage as SecureStorageService),
    );

    // register a global control notifier
    final blankClientInfo = ClientInformation(
      Environment('', '', {}),
    );
    DIContainer.container.registerSingleton<GlobalControlNotifier>(
      (container) => GlobalControlNotifier(blankClientInfo),
      name: globalControlNotifierKey,
    );

    // register a network client and its dependencies
    if (useMockNetworkClient) {
      DIContainer.container.registerSingleton<INetworkClient>(
        (c) => MockNetworkClient(), //todo must not be hardcoded here
        name: networkClientKey,
      );
    } else {
      DIContainer.container.registerSingleton<INetworkClient>(
        (c) => NetworkClient(
          http.Client(),
          c.resolve<IConnectivity>(),
          c.resolve(globalControlNotifierKey),
          c.resolve<IAuthManager>(),
          RequiredHeadersGenerator(
            PlatformRetrieverImpl(),
            c.resolve<AppInfoRetriever>(),
            DeviceInfoRetrieverImpl(),
          ),
        ),
        name: networkClientKey,
      );
    }
  }
}
