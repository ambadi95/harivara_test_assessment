import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IWelcomeBackService {
  static const getAgentDetailIdentifier = 'details';
  static const getCustomerDetailIdentifier = 'customerDetails';
  static const agentLoginIdentifier = 'agentLogin';
  static const customerLoginIdentifier = 'customerLogin';

  Future<StandardRequest> getAgentDetails(String agentId);

  Future<StandardRequest> getCustomerDetails(String customerId);

  Future<StandardRequest> loginAgent(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> loginCustomer(
      Map<String, dynamic> requestData,
      );
}

class WelcomeBackService implements IWelcomeBackService {
  @override
  Future<StandardRequest> getAgentDetails(String agentId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'agent-details/$agentId';
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetails(String customerId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer-details/$customerId';
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

  @override
  Future<StandardRequest> loginCustomer(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer-login';
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
