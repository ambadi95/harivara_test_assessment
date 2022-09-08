import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class KycCreditService {
  static const kycCheckIdentifier = 'kyc-check';
  static const creditScoreIdentifier = 'credit-score';
  static const creditCheckIdentifier = 'credit-check';

  Future<StandardRequest> kycCheck(
    Map<String, dynamic> requestData,
  );

 Future<StandardRequest> creditCheck(
    Map<String, dynamic> requestData,
  );
 Future<StandardRequest> creditScore(
    Map<String, dynamic> requestData,
  );




}

class IKycCreditService implements KycCreditService {

  @override
  Future<StandardRequest> kycCheck(
    Map<String, dynamic> requestData,
  ) async {

    String number = requestData['mobileNumber'].toString().substring(4);
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint + 'payment/kyc-check/${number}[customer]';
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

@override
  Future<StandardRequest> creditScore(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'creditcheck/credit-score[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }


}
