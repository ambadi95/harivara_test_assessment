import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IConfigureMdmService {
  static const mdmRegistrationIdentifier = 'mdm-registration';


  Future<StandardRequest> mdmRegistration(int customerId,String imei);

}

class ConfigureMdmService implements IConfigureMdmService {

  @override
  Future<StandardRequest> mdmRegistration(
      int customerId, String imei) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'mdm-registration[customer]';
    request.jsonBody =
        json.encode({"customerId": customerId, 'imei': imei});

    return request;
  }
}
