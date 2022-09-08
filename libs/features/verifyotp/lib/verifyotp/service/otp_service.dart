import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:shared_data_models/welcome/otp/request/otp_request.dart';

abstract class IOtpService {
  static const otpIdentifier = 'otp';
  static const otpVerifyIdentifier = 'otpVerify';
  static const otpGenCustomerByAgentIdentifier = 'otpGenCustomerByAgent';
  static const otpVerifyCustomerByAgentIdentifier = 'otpVerifyCustomerByAgent';
  static const workFlowCustomerByAgentIdentifier = 'workFlowCustomerByAgent';
  static const customerDetailsIdentifier = 'getCustomerDetails';


  Future<StandardRequest> otpGen(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> otpVerify(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> otpGenCustomerByAgent(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> otpVerifyCustomerByAgent(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> workFlowCustomerByAgent(
      String customerId
  );

  Future<StandardRequest> getCustomerDetailByMobileNo(
      String phoneNo
      );
}

class OtpService implements IOtpService {
  @override
  Future<StandardRequest> otpGen(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'otp-gen';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  Future<StandardRequest> otpVerify(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'otp-validate';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> otpGenCustomerByAgent(
      Map<String, dynamic> requestData) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = '${customerEndpoint}otp-gen[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> otpVerifyCustomerByAgent(
      Map<String, dynamic> requestData) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = '${customerEndpoint}otp-validate[customer]';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> workFlowCustomerByAgent(
      String customerId ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = '${customerEndpoint}workflowstatus/${customerId}[customer]';
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetailByMobileNo(
      String phoneNo,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =  'customer-details-by-mobile/$phoneNo';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }
}
