import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ISignupService {
  static const signupIdentifier = 'signup';
  static const signUpAgentIdentifier = 'signUpAgent';
  static const signUpCustomerByAgent = 'signUpCustomerByAgent';

  Future<StandardRequest> signup(
    String nindaNumber,
    String phoneNo,
  );

  Future<StandardRequest> signupAgent(
    String nidaNumber,
    String agentId,
  );

  Future<StandardRequest> signupCustomerByAgent(
      {required String nidaNumber,
      required String agentId,
      required String customerMobileNumber,
      required String token});
}

class SignupService implements ISignupService {
  @override
  Future<StandardRequest> signup(
    String nindaNumber,
    String phoneNo,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'register-customer';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode({
      'nidaNo': nindaNumber,
      'mobileNo': '+255' + phoneNo,
    });
    return request;
  }

  @override
  Future<StandardRequest> signupAgent(
    String nidaNumber,
    String agentId,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'register-agent';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode({
      'nidaNo': nidaNumber,
      'y9AgentId': agentId,
    });
    return request;
  }

  @override
  Future<StandardRequest> signupCustomerByAgent(
      {required String nidaNumber,
      required String agentId,
      required String customerMobileNumber,
      required String token}) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'register-customer';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    request.jsonBody = json.encode({
      'nidaNo': nidaNumber,
      'mobileNo': customerMobileNumber,
      'y9AgentId': agentId,
    });
    CrayonPaymentLogger.logInfo(request.jsonBody.toString());
    CrayonPaymentLogger.logInfo(token);

    return request;
  }
}
