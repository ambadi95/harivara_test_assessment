import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPasscodeService {
  static const passcodeIdentifier = 'passcode';
  static const resetPasscodeIdentifier = 'resetPasscode';
  static const loginIdentifier = 'login';
  static const agentLoginIdentifier = 'agentLogin';
  static const agentCustomerSignUpIdentifier = 'agentCustomerSignup';

  Future<StandardRequest> savePasscode(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> savePasscodeAgentCustomer(
      Map<String, dynamic> requestData, UserType userType);

  Future<StandardRequest> resetPasscode(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> login(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> loginAgent(
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
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> savePasscodeAgentCustomer(
      Map<String, dynamic> requestData, UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = userType == UserType.AgentCustomer
        ? customerEndpoint + 'save-passcode[customer]'
        : 'save-passcode';
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
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent-login';
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
