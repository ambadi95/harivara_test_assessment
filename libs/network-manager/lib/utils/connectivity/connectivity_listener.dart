import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/mobile_core.dart';
import 'package:network_manager/utils/connectivity/i_connectivity.dart';
import 'package:network_manager/utils/connectivity/internet_address_wrapper.dart';

/// The [ConnectivityListener] actively listens to changes in network state and
/// then checks the internet connectivity when those changes in state occur.
///
/// It allows other classes to subscribe to updates about the state of
/// connection to the internet
class ConnectivityListener implements IConnectivity {
  final StreamController<bool> _connectionChangeController;
  final Connectivity _connectivity;
  final InternetAddressWrapper _internetAddress;

  ConnectivityListener(
    this._connectivity,
    this._connectionChangeController,
    this._internetAddress,
  );

  bool _hasConnection = false;
  bool _isInitialised = false;

  @override
  bool get hasConnection => _hasConnection;

  @override
  Stream<bool> get connectionChange {
    if (!_isInitialised) {
      throw Exception(
        'You must initialise the connection library before using it.',
      );
    }
    return _connectionChangeController.stream;
  }

  @override
  Future initialize() async {
    CrayonPaymentLogger.logInfo<ConnectivityListener>('initialising..');
    // setting initialised property as first command as it could obstruct the
    // creation of services and prevent the app starting when on a slow
    // connection.
    _isInitialised = true;
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    await checkConnection();
  }

  @override
  Future<bool> checkConnection() async {
    CrayonPaymentLogger.logInfo<ConnectivityListener>(
      'Checking the applications connection to the internet.',
    );
    final previousConnection = _hasConnection;
    try {
      final result = await _internetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _hasConnection = true;
        CrayonPaymentLogger.logInfo<ConnectivityListener>(
          'The app is connected to the internet',
        );
      } else {
        _hasConnection = false;
        CrayonPaymentLogger.logInfo<ConnectivityListener>(
          'The app does not have connection to the internet',
        );
      }
    } on SocketException catch (_) {
      _hasConnection = false;
      CrayonPaymentLogger.logInfo<ConnectivityListener>(
        'The app does not have connection to the internet',
      );
    }

    // send a connection status update to observing classes
    if (previousConnection != _hasConnection) {
      _connectionChangeController.add(_hasConnection);
    }

    return _hasConnection;
  }

  void _connectionChange(ConnectivityResult result) async {
    await checkConnection();
  }

  // closes the stream
  void dispose() {
    _connectionChangeController.close();
  }
}
