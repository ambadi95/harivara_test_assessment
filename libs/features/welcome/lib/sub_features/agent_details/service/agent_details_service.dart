import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IAgentDetailsService {
  static const detailIdentifier = 'details';
  static const submitAgentDetailIdentifier = 'submitAgentDetail';

  Future<StandardRequest> getAgentDetail(String agentId);

  Future<StandardRequest> submitAgentDetails(
    Map<String, dynamic> requestData,
  );
}

class AgentDetailsService implements IAgentDetailsService {
  @override
  Future<StandardRequest> getAgentDetail(String agentId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'agent-details/$agentId';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> submitAgentDetails(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
