import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ILoginService {
  static const jwtIdentifier = 'jwt';
  static const loginIdentifier = 'login';
  static const loginAgentIdentifier = 'loginAgent';
  static const agentDetailIdentifier = 'getAgent';

  Future<StandardRequest> jwttoken(
    Map<String, dynamic> requestData,
  );
 Future<StandardRequest> login(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> getAgentDetails(String agentId, String mobileNumber);
}

class LoginService implements ILoginService {

  @override
  Future<StandardRequest> jwttoken(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'auth/token';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'Accept' : 'application/json',
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
    request.customHeaders = await request.headers();
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> getAgentDetails(
      String agentId, String mobileNumber) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'agent-details-by-agentid-mobile-number';
    request.jsonBody =
        json.encode({"mobileNumber": mobileNumber, "y9AgentId": agentId});
        request.customHeaders = await request.headers();
    return request;
  }

  @override
  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent-login';
        request.customHeaders = await request.headers();
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
