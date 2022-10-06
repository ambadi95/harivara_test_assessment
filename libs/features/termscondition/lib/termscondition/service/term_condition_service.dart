import 'dart:convert';
import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ITermConditionService {
  static const SaveConsentByAgentIdentifier = 'saveTcConsentByAgent';
  static const SaveConsentByCustomerIdentifier = 'saveTcConsentByCustomer';

  Future<StandardRequest> saveConsentByAgent(
      Map<String, dynamic> requestData,
      );

  Future<StandardRequest> saveConsentByCustomer(
      Map<String, dynamic> requestData,
      );
}

class TermConditionService implements ITermConditionService {
  @override
  Future<StandardRequest> saveConsentByAgent(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'save-tc-consent';
    request.jsonBody =  json.encode(requestData);
    print("save Consent by Agent===> ${request.jsonBody}");
    return request;
  }

  @override
  Future<StandardRequest> saveConsentByCustomer(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'save-tc-consent[customer]';
    request.jsonBody =  json.encode(requestData);
    print("save Consent by Customer===> ${request.jsonBody}");
    return request;
  }
}