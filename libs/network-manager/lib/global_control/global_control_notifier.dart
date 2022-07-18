import 'package:flutter/widgets.dart';

import 'model/client_information/client_information.dart';
import 'model/configuration/config.dart';

/// A global controller for network state and activity.
///
/// Currently implemented as a singleton that can be referenced by observing
/// network services in order to receive important updates on network state.
class GlobalControlNotifier extends ValueNotifier<ClientInformation> {
  late Config _config;
  late Map<String, String> _standardHeaders;

  GlobalControlNotifier(ClientInformation clientInformation)
      : super(clientInformation) {
    _standardHeaders = {};
  }

  void initialise(Config config) {
    updateConfig(config);
    updateClientInformation();
  }

  void updateClientInformation() {
    final currentEnvironment = selectCurrentEnvironment();
    final clientInformation = ClientInformation(currentEnvironment);
    value = clientInformation;
    notifyListeners();
  }

  Environment selectCurrentEnvironment() {
    // todo: logic for env selection here.
    return _config.environments[0];
  }

  void updateConfig(Config config) {
    _config = config;
  }

  Map<String, String> get standardHeaders => _standardHeaders;

  // Future<String> get certificate async => await _config.certificate;
  List<int> get certificateBytes => _config.certificateBytes;

  Environment getCurrentEnvironment() {
    return value.environment;
  }
}
