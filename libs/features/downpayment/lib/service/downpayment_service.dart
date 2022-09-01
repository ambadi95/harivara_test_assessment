import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class DownPaymentService {
  static const createLoanIdentifier = 'createLoan';
  static const activateLoanIdentifier = 'activateLoane';

  Future<StandardRequest> createLoan(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> activateLoan(
    Map<String, dynamic> requestData,
  );
}

class IDownPaymentService implements DownPaymentService {
  @override
  Future<StandardRequest> createLoan(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'loans/create-loan[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> activateLoan(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'loans/loan-approval[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
