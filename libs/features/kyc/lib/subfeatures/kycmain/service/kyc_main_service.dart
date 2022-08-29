import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class KycMainService {
  static const consentIndentifier = 'mno-consent';

  Future<StandardRequest> callConsent(
    Map<String, dynamic> requestData,
  );




}

class IKycMainService implements KycMainService {

  @override
  Future<StandardRequest> callConsent(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'creditcheck/save-mno-consent';
    request.jsonBody = json.encode(requestData);
    return request;
  }


}
