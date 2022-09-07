

import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPaymentStatusService {

  static const paymentStatusIdentifier = 'payment-status';

  Future<StandardRequest> checkPaymentStatus(
      Map<String, dynamic> requestData,
      );
}

class PaymentStatusService implements IPaymentStatusService {
  @override
  Future<StandardRequest> checkPaymentStatus(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =  'payment/payment-status/${requestData["paymentId"]}';
    request.jsonBody = json.encode(requestData);
    return request;
  }

}