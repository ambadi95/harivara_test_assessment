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
    request.jsonBody =  json.encode({"mobileNumber": requestData["mobileNumber"], "passcode": requestData["passcode"]});
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

    print(request.jsonBody);
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
