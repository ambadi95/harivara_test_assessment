import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class DownPaymentService {
  static const makePaymentIdentifier = 'make-payment';
  static const paymentStatusIdentifier = 'payment-status';
  static const makePaymentMpesaIdentifier = 'make-payment-mpesa';
  static const paymentStatusMpesaIdentifier = 'payment-status-mpesa';
  static const createLoanIdentifier = 'createLoan';
  static const activateLoanIdentifier = 'activateLoane';

  Future<StandardRequest> makePayment(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> makePaymentMpesa(
      Map<String, dynamic> requestData,
      );

  Future<StandardRequest> checkPaymentStatusMpesa(
      Map<String, dynamic> requestData,
      );

  Future<StandardRequest> checkPaymentStatus(
    Map<String, dynamic> requestData,
  );
  Future<StandardRequest> createLoan(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> activateLoan(
    Map<String, dynamic> requestData,
  );
}

class IDownPaymentService implements DownPaymentService {
  @override
  Future<StandardRequest> createLoan(Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'loans/create-loan[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> activateLoan(
      Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'loans/loan-approval[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> makePayment(Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint + 'payment/make-payment[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }


  @override
  Future<StandardRequest> checkPaymentStatus(
      Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint +
        'payment/payment-status/${requestData["paymentId"]}[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> makePaymentMpesa(
      Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint =
        customerEndpoint + 'payment/mpesa/make-payment[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> checkPaymentStatusMpesa(
      Map<String, dynamic> requestData,) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint +
        'payment/mpesa/payment-status/${requestData["paymentId"]}[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

}

