import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/user_client.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/status/http_status.dart';
import 'package:shared_data_models/kyc/merchant_details_response.dart';
import 'package:shared_data_models/logout/logout_request.dart';
import 'package:shared_data_models/merchant/create_merchant_request.dart';
import 'package:shared_data_models/merchant/create_merchant_response.dart';
import 'package:shared_data_models/merchant/merchant_sign_in_response.dart';
import 'package:shared_data_models/passcode/passcode_request.dart';
import 'package:shared_data_models/signup/create_response.dart';

class MerchantClient implements IUserClient {
  final INetworkClient _client;

  final IUserManager _userManager;

  MerchantClient(this._client, this._userManager);

  @override
  Future<dynamic> getUserInformation(
    Function onErrorCallback,
  ) async {
    try {
      var mobileNumber = await _userManager.getUserMobile();
      var standardRequest = StandardRequest();
      standardRequest.requestType = RequestType.GET;
      standardRequest.endpoint =
          'merchant/merchants/v2.0/merchant/$mobileNumber';
      standardRequest.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app'
      };

      final response = await _client.standardRequest(standardRequest);
      if (response.statusCode == HttpStatus.ok) {
        var merchantDetailsResponse =
            MerchantResponse.fromJson(response.jsonResult!);

        _userManager.setUserId(
          merchantDetailsResponse.merchantId,
        );
        _userManager.setWalletId(
          '12',
        );
        _userManager.setUserMobile(merchantDetailsResponse.mobileNo);
        _userManager.setUserName(merchantDetailsResponse.companyName);
        return merchantDetailsResponse;
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
    var merchantRequest = request as SubmitMerchantApplicationRequest;
    var standardRequest = StandardRequest();
    standardRequest.requestType = RequestType.POST;
    standardRequest.endpoint = 'merchant/merchants/v2.0/merchant';
    standardRequest.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app'
    };
    standardRequest.jsonBody = jsonEncode(merchantRequest.toJson());

    final response = await _client.standardRequest(standardRequest);
    if (response.statusCode == HttpStatus.ok) {
      var customerResponse =
          CreateMerchantResponse.fromJson(response.jsonResult!);
      _userManager.setUserMobile(merchantRequest.mobileNo);
      return customerResponse;
    } else {
      CrayonPaymentLogger.logDebug('Status Code = ${response.statusCode.toString()}');
      var customerResponse =
      CreateMerchantResponse.fromJson(response.jsonResult!);
      return customerResponse;
    }
  }

  @override
  Future<CreateResponse?> login(
    PasscodeRequest passcodeRequest, [
    Function(String)? onErrorCallback,
  ]) async {
    try {
      var standardRequest = StandardRequest();
      standardRequest.requestType = RequestType.POST;
      standardRequest.endpoint = 'merchant/merchants/v2.0/identity';
      standardRequest.customHeaders = {
        'Content-Type': 'application/json',
        'x-CrayonPayment-channel': 'app'
      };
      standardRequest.showBusy = true;
      standardRequest.jsonBody = jsonEncode(passcodeRequest.toJson());

      final response = await _client.standardRequest(standardRequest);
      var merchantSignInResponse =
          MerchantSignInResponse.fromJson(response.jsonResult!);
      return merchantSignInResponse;
    } catch (e) {
      CrayonPaymentLogger.logDebug('Status Code = ${e.toString()}');
      return onErrorCallback?.call(e.toString());
    }
  }

  @override
  Future getKycUserInformation(Function(String p1) onErrorCallback) async {
    await getUserInformation(
      onErrorCallback,
    );
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
    try {
      var request = StandardRequest();
      request.requestType = RequestType.POST;
      request.endpoint = 'merchant/merchants/v2.0/logout';
      request.jsonBody = jsonEncode(logoutRequest.toJson());
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
