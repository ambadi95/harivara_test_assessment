import 'dart:convert';

import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ISignupService {
  static const jwtIdentifier = 'jwt';
  static const signupIdentifier = 'signup';
  static const signUpAgentIdentifier = 'signUpAgent';
  static const signUpCustomerByAgent = 'signUpCustomerByAgent';
  static const getCustomerDetailIdentifier = 'getCustomerDetail';
  static const getCustomerDetailByNidaMobileAndIdentifier = 'getCustomerDetailMobileNida';
  static const getCustomerDetailByMobileNumberIdentifier = 'getCustomerDetailByMobileNumber';
  static const agentDetailIdentifier = 'getAgent';
  static const getTelcoListIdentifier = 'getTelcoList';


  Future<StandardRequest> jwttoken(
    Map<String, dynamic> requestData,
  );

  Future<StandardRequest> signup(
    String nindaNumber,
    String phoneNo,
    String referralCode
  );

  Future<StandardRequest> signupAgent(
    String nidaNumber,
    String agentId,
  );

  Future<StandardRequest> getCustomerDetail(
    String nindaNumber,
    String phoneNo,
  );

  Future<StandardRequest> getPaymentMode(
      );

  Future<StandardRequest> getCustomerDetailByMobileNo(
      String phoneNo,
      );

  Future<StandardRequest> signupCustomerByAgent(
      {required String nidaNumber,
      required String agentId,
      required String customerMobileNumber,
      required String telcoPartner,
      required  String referralCode,
      required String token});


  Future<StandardRequest> getAgentDetails(Map<String, dynamic> requestData);
}



class SignupService implements ISignupService {
  @override
  Future<StandardRequest> jwttoken(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'auth/token';
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> signup(
    String nindaNumber,
    String phoneNo,
      String referralCode
  ) async {
    print(json.encode({
      'nidaNo': nindaNumber,
      'mobileNo': '+255' + phoneNo,
      "referralCode": referralCode,
    }));
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'register-customer';
    request.jsonBody = json.encode({
      'nidaNo': nindaNumber,
      'mobileNo': '+255' + phoneNo,
      "referralCode": referralCode,
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
    request.jsonBody = json.encode({
      'nidaNo': nidaNumber,
      'y9AgentId': agentId,
    });
    return request;
  }

  @override
  Future<StandardRequest> getPaymentMode() async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =  'telco';
    CrayonPaymentLogger.logInfo(request.jsonBody.toString());
    return request;
  }

  @override
  Future<StandardRequest> signupCustomerByAgent(
      {required String nidaNumber,
      required String agentId,
      required String customerMobileNumber,
      required String telcoPartner,
      required  String referralCode,
      required String token}) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = customerEndpoint +  'register-customer-by-agent[customer]';
    request.jsonBody = json.encode({
      'nidaNo': nidaNumber,
      'mobileNo': customerMobileNumber,
      'y9AgentId': agentId,
      'telcoPartner':telcoPartner,
      "referralCode": referralCode
    });
    CrayonPaymentLogger.logInfo(request.jsonBody.toString());
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetail(
    String nindaNumber,
    String phoneNo,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode({
      'nidaNo': nindaNumber,
      'mobileNo': phoneNo,
    });
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetailByMobileNo(
      String phoneNo,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint +  'customer-details-by-mobile/$phoneNo[customer]';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> getAgentDetails(
      Map<String, dynamic> requestData) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'agent-details';
    request.jsonBody =
        json.encode({"nidaNo": requestData["nidaNumber"], "y9AgentId": requestData["agentId"]});
    print(requestData);
    return request;
  }
}
