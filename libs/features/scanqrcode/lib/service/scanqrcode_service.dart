import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IScanQRCodeService {

  static const deviceRegisterIdentifier = 'device-register';

  Future<StandardRequest> deviceRegister(
      Map<String, dynamic> requestData,
      );

}

class ScanQRCodeService implements IScanQRCodeService {

  @override
  Future<StandardRequest> deviceRegister(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer-device';
    request.jsonBody =  json.encode({
      "customerId": requestData["customerId"],
      "deviceId": requestData["deviceId"],
      "imei1": requestData["imei1"],
      "imei2": requestData["imei2"],
    });
    print("device register===> $request");
    return request;
  }

}
