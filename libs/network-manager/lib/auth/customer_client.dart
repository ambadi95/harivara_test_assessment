import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/user_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/status/http_status.dart';
import 'package:shared_data_models/customer/create_customer_request.dart';
import 'package:shared_data_models/customer/create_customer_response.dart';
import 'package:shared_data_models/customer/customer_model.dart';
import 'package:shared_data_models/logout/logout_request.dart';
import 'package:shared_data_models/passcode/passcode_request.dart';
import 'package:shared_data_models/signup/create_response.dart';

class CustomerClient implements IUserClient {
  final INetworkClient _client;

  final IUserManager _userManager;

  CustomerClient(this._client, this._userManager);

  @override
  Future<dynamic> getUserInformation(
    Function(String) onErrorCallback,
  ) async {
    var mobileNumber = await _userManager.getUserMobile();
    try {
      var request = StandardRequest();
      request.requestType = RequestType.GET;
      request.endpoint = 'customer/customers/v2.0/customer/$mobileNumber';
      request.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app',
      };

      final response = await _client.standardRequest(request);
      if (response.statusCode == HttpStatus.ok) {
        var customerResponse = CustomerModel.fromJson(response.jsonResult!);
        _userManager.setWalletId(customerResponse.walletId);
        _userManager.setUserId(customerResponse.customerId);
        _userManager.setUserMobile(customerResponse.mobileNo);
        return customerResponse;
      } else {
        CrayonPaymentLogger.logDebug('Status Code = ${response.statusCode.toString()}');
        return onErrorCallback(response.statusCode.toString());
      }
    } catch (e) {
      CrayonPaymentLogger.logDebug('Error = ${e.toString()}');
      return onErrorCallback(e.toString());
    }
  }

  @override
  Future<dynamic> createUser(
    request,
    Function(String p1) onErrorCallback,
  ) async {
    var customerRequest = request as CreateCustomerRequest;
    var standardRequest = StandardRequest();
    standardRequest.requestType = RequestType.POST;
    standardRequest.endpoint = 'customer/customers/v2.0/customer';
    standardRequest.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app'
    };
    standardRequest.jsonBody = jsonEncode(customerRequest.toJson());

    final response = await _client.standardRequest(standardRequest);
    if (response.statusCode == HttpStatus.ok) {
      var customerResponse =
          CreateCustomerResponse.fromJson(response.jsonResult!);
      _userManager.setUserMobile(customerRequest.mobileNo);

      var passcodeRequest = new PasscodeRequest(
        mobileNo: request.mobileNo!,
        password: request.password!,
        language: 'en',
      );
      await login(passcodeRequest);

      _userManager.clearPasscode();
      return customerResponse;
    } else {
      CrayonPaymentLogger.logDebug('Status Code = ${response.statusCode.toString()}');
      return onErrorCallback(response.statusCode.toString());
    }
  }

  @override
  Future<CreateResponse?> login(
    PasscodeRequest passcodeRequest, [
    Function(String p1)? onErrorCallback,
  ]) async {
    try {
      var standardRequest = StandardRequest();
      standardRequest.requestType = RequestType.POST;
      standardRequest.endpoint = 'customer/customers/v2.0/identity';
      standardRequest.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app'
      };
      standardRequest.showBusy = true;
      standardRequest.jsonBody = jsonEncode(passcodeRequest.toJson());

      final response = await _client.standardRequest(standardRequest);
      var customerResponse =
          CreateCustomerResponse.fromJson(response.jsonResult!);
      return customerResponse;
    } catch (e) {
      CrayonPaymentLogger.logDebug('Status Code = ${e.toString()}');
      return onErrorCallback?.call(e.toString());
    }
  }

  @override
  Future getKycUserInformation(Function(String p1) onErrorCallback) async {
    var userId = await _userManager.getUserId();
    try {
      var request = StandardRequest();
      request.requestType = RequestType.GET;
      request.endpoint = 'customer/customers/v1.0/customer/$userId';
      request.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app',
      };

      final response = await _client.standardRequest(request);
      if (response.statusCode == HttpStatus.ok) {
        var customerResponse = CustomerModel.fromJson(response.jsonResult!);
        _userManager.setWalletId(customerResponse.walletId);
        _userManager.setUserId(customerResponse.customerId);
        _userManager.setUserMobile(customerResponse.mobileNo);
        return customerResponse;
      } else {
        CrayonPaymentLogger.logDebug('Status Code = ${response.statusCode.toString()}');
        return onErrorCallback(response.statusCode.toString());
      }
    } catch (e) {
      CrayonPaymentLogger.logDebug('Error = ${e.toString()}');
      return onErrorCallback(e.toString());
    }
  }

  @override
  Future<bool> signOut(
    String mobileNumber,
    bool Function(String error) onErrorCallback,
  ) async {
    var logoutRequest = LogoutRequest(
      bearerCode: 'MOBILE',
      language: 'en',
      mobileNo: mobileNumber,
    );
    var requestBody = jsonEncode(logoutRequest.toJson());
    try {
      var request = StandardRequest();
      request.requestType = RequestType.POST;
      request.endpoint = 'customer/customers/v2.0/logout';
      request.jsonBody = requestBody;
      request.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app',
      };

      final response = await _client.standardRequest(request);
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        CrayonPaymentLogger.logDebug('Status Code = ${response.statusCode.toString()}');
        return onErrorCallback(response.statusCode.toString());
      }
    } catch (e) {
      CrayonPaymentLogger.logDebug('Error = ${e.toString()}');
      return onErrorCallback(e.toString());
    }
  }
}
