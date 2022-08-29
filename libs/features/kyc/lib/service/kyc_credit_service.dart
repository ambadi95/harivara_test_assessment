import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class KycCreditService {
  static const kyccheckIndentifier = 'payment/kyc-check/';

  Future<StandardRequest> kycCheck(
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
    request.endpoint = 'payment/kyc-check';
    request.jsonBody = json.encode(requestData);
    return request;
  }


}
