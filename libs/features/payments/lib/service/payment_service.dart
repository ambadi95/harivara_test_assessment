import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPaymentService {
  static const paymentIdentifier = 'payApi';

  Future<StandardRequest> payApi(Map<String, dynamic> requestData);
}

class PaymentService implements IPaymentService {
  @override
  Future<StandardRequest> payApi(Map<String, dynamic> requestData) async {
    print("PAY API");
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'payment/make-payment';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };

    CrayonPaymentLogger.logInfo(requestData.toString());
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
