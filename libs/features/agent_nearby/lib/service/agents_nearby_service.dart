import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IAgentsNearByService {
  static const agentsIdentifier = 'nearbyAgents';

  Future<StandardRequest> getAgentsNearBy(String genericSearchValue);
}

class AgentsNearByService implements IAgentsNearByService {
  @override
  Future<StandardRequest> getAgentsNearBy(
    String genericSearchValue,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'nearby-agents';
    request.jsonBody = json.encode({"genericSearchValue": genericSearchValue});
    return request;
  }
}
