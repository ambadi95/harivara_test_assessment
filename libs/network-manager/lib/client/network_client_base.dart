import 'dart:async';

import 'package:network_manager/global_control/global_control_notifier.dart';
import 'package:network_manager/global_control/model/configuration/config.dart';
import 'package:network_manager/utils/connectivity/i_connectivity.dart';
import 'package:core/logging/logger.dart';
import 'package:core/utils/extensions/map_extensions.dart';
import 'package:http/http.dart' as http;

abstract class NetworkClientBase {
  // ignore: unused_field
  final http.Client _httpClient;
  final IConnectivity _connectivityListener;
  final GlobalControlNotifier _globalControlNotifier;

  // subject to change, cannot be final
  late Environment currentEnvironment;

  bool hasInternet = true;
  Map<String, String>? _standardHeaders;
  late StreamSubscription _connectionChangeStream;

  NetworkClientBase(
    this._httpClient,
    this._connectivityListener,
    this._globalControlNotifier,
  ) {
    hasInternet = _connectivityListener.hasConnection;
    _connectionChangeStream =
        _connectivityListener.connectionChange.listen(_connectionChanged);
    currentEnvironment = _globalControlNotifier.getCurrentEnvironment();
    _globalControlNotifier.addListener(_configurationChanged);
    _standardHeaders = <String, String>{}; // get from global config or static
  }

  /// Combines the standard global headers for the API with any [customHeaders]
  /// based headers.
  Map<String, String>? buildHeaders(Map<String, String>? customHeaders) {
    CrayonPaymentLogger.logDebug<NetworkClientBase>(
        'Building headers for request');
    final headers = _standardHeaders;
    if (!customHeaders.isNullOrEmpty()) {
      headers!.addAll(customHeaders!);
    }
    return headers;
  }

  // Future<List<int>> getCertificateBytes() async {
  //   final certificate = await _globalControlNotifier.certificate;
  //   return utf8.encode(certificate);
  // }
  List<int> getCertificateBytes() => _globalControlNotifier.certificateBytes;

  void _connectionChanged(bool hasConnection) {
    hasInternet = hasConnection;
  }

  void _configurationChanged() {
    currentEnvironment = _globalControlNotifier.getCurrentEnvironment();
  }

  void dispose() {
    _connectionChangeStream.cancel();
  }
}
