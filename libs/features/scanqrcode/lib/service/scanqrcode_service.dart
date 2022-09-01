import 'dart:convert';

import 'package:config/Config.dart';
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
    request.endpoint = customerEndpoint + "device/customer-device[customer]";
    request.jsonBody =  json.encode(requestData);
    print("device register===> ${request.jsonBody}");
    return request;
  }

}
