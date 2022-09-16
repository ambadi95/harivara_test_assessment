import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IConfigureMdmService {
  static const mdmRegistrationIdentifier = 'mdm-registration';
  static const mdmStatusUpdateIdentifier = 'mdm-status-update';


  Future<StandardRequest> mdmRegistration(int customerId,String imei);

  Future<StandardRequest> mdmStatusUpdate(int customerId,String imei);

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

  @override
  Future<StandardRequest> mdmStatusUpdate(
      int customerId, String imei) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'mdm-update-status[customer]';
    request.jsonBody =
        json.encode({"customerId": customerId, 'imei': imei});

    return request;
  }
}
