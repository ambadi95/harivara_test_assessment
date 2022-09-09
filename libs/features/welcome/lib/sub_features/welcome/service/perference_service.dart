import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPreferencesService {
  static const preferencesIdentifier = 'preferences';

  Future<StandardRequest> setPreferences(String customerId, String lang);
}

class PreferencesService implements IPreferencesService {
  @override
  Future<StandardRequest> setPreferences(String customerId, String lang) async {
    var request = StandardRequest();
    request.requestType = RequestType.PUT;
    request.endpoint = 'preferences/$customerId';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode({
      'lang': lang,
    });
    return request;
  }
}
