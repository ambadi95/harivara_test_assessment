import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class KycCreditService {
  static const kycCheckIdentifier = 'kyc-check';
  static const creditCheckIdentifier = 'credit-check';

  Future<StandardRequest> kycCheck(
    Map<String, dynamic> requestData,
  );

 Future<StandardRequest> creditCheck(
    Map<String, dynamic> requestData,
  );




}

class IKycCreditService implements KycCreditService {

  @override
  Future<StandardRequest> kycCheck(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint + 'payment/kyc-check/${requestData['mobileNumber']}[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

 @override
  Future<StandardRequest> creditCheck(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint + 'creditcheck/status/${requestData['customerId']}[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }


}
