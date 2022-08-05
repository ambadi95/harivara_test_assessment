

import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ISignupService{
  static const signupIdentifier = 'signup';

  Future<StandardRequest> signup(
      String nindaNumber,
      String phoneNo,
      );
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
    request.jsonBody =
        json.encode({'nidaNo': nindaNumber, 'mobileNo': '+255' + phoneNo,});
    return request;
  }
}