import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IDeviceOptionService {
  static const deviceOptionIdentifier = 'deviceOption';
  static const deviceDetailIdentifier = 'deviceDetail';
  static const selectDeviceIdentifier = 'selectDevice';

  Future<StandardRequest> deviceList(int customerId);

  Future<StandardRequest> deviceDetail(int deviceId, String token);

  Future<StandardRequest> selectDevice(
      int customer, int deviceId, String token);
}

class DeviceOptionService implements IDeviceOptionService {
  @override
  Future<StandardRequest> deviceList(int customerId) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'device-list[customer]';
    request.jsonBody = json.encode({"customerId": customerId});
    return request;
  }

  @override
  Future<StandardRequest> deviceDetail(int deviceId, String token) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =
        customerEndpoint + 'device-details/${deviceId.toString()}[customer]';

    return request;
  }

  @override
  Future<StandardRequest> selectDevice(
      int customerId, int device, String token) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'customer-device[customer]';
    request.jsonBody =
        json.encode({"customerId": customerId, 'deviceId': device});

    return request;
  }
}
