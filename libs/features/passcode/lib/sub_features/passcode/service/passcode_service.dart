import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPasscodeService {
  static const passcodeIdentifier = 'passcode';
  static const resetPasscodeIdentifier = 'resetPasscode';
  static const loginIdentifier = 'login';

  Future<StandardRequest> savePasscode(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> resetPasscode(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> login(
    Map<String, dynamic> requestData,
  );
}

class PasscodeService implements IPasscodeService {
  @override
  Future<StandardRequest> savePasscode(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'save-passcode';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> resetPasscode(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'save-passcode';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> login(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer-login';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
