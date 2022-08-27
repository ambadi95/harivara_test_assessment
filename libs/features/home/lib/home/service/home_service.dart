import 'dart:convert';

import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IHomeService {
  static const customerCountIdentifier = 'customerCount';
  static const customerLoanDetails = 'loanDetails';

  Future<StandardRequest> getCustomerCount(String token, String agentId);
  Future<StandardRequest> getLoanDetails(String token, String customerId);
}

class HomeService implements IHomeService {
  @override
  Future<StandardRequest> getCustomerCount(String token, String agentId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =
        '${customerEndpoint}agent-customer-count/$agentId[customer]';

    return request;
  }

  @override
  Future<StandardRequest> getLoanDetails(
      String token, String customerId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'loans/loan-details/$customerId';

    return request;
  }
}
