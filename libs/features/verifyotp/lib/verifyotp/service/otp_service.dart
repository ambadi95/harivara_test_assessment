

import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:shared_data_models/welcome/otp/request/otp_request.dart';

abstract class IOtpService{
  static const otpIdentifier = 'otp';
  static const otpVerifyIdentifier = 'otpVerify';

  Future<StandardRequest> otpGen(
      Map<String, dynamic> requestData,
      );

  Future<StandardRequest> otpVerify(
      Map<String, dynamic> requestData,
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
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }

  Future<StandardRequest> otpVerify(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'otp-validate';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}