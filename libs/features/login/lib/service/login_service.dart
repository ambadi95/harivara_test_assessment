import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ILoginService {
  static const loginIdentifier = 'login';
  static const loginAgentIdentifier = 'loginAgent';
  static const agentDetailIdentifier = 'getAgent';

  Future<StandardRequest> login(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> getAgentDetails(String agentId);
}

class LoginService implements ILoginService {
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

  @override
  Future<StandardRequest> getAgentDetails(String agentId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'agent-details/$agentId';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent-login';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
