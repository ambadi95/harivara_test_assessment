import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IDeviceOptionService {
  static const deviceOptionIdentifier = 'deviceOption';
  static const deviceDetailIdentifier = 'deviceDetail';
  static const selectDeviceIdentifier = 'selectDevice';


  Future<StandardRequest> deviceList(
      Map<String, dynamic> requestData
  );

  Future<StandardRequest> deviceDetail(
      String deviceId
      );
}

class DeviceOptionService implements IDeviceOptionService {
  @override
  Future<StandardRequest> deviceList(
      Map<String, dynamic> requestData
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'device-list';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> deviceDetail(
      String deviceId
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'device-details/'+deviceId;
    return request;
  }
}
