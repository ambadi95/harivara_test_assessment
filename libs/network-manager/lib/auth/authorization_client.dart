import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/common.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/client/i_network_client.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';
import 'package:network_manager/model/response/token/token_response.dart';
import 'package:shared_data_models/auth/auth_detail.dart';

class AuthorizationClient {
  final String _userType;
  final INetworkClient _client;
  final IAuthManager _authManager;
  final IUserManager _userManager;

  AuthorizationClient(
    this._userType,
    this._client,
    this._authManager,
    this._userManager,
  );

  factory AuthorizationClient.forMerchantApp(
    INetworkClient client,
    IAuthManager authManager,
    IUserManager userManager,
  ) =>
      AuthorizationClient('MERCHANT', client, authManager, userManager);

  factory AuthorizationClient.forCustomerApp(
    INetworkClient client,
    IAuthManager authManager,
    IUserManager userManager,
  ) =>
      AuthorizationClient('CUSTOMER', client, authManager, userManager);

  Future<TokenResponse?> requestToken(
    Function onErrorCallback,
  ) async {
    try {
      var mobileNumber = await _userManager.getUserMobile();
      var request = StandardRequest();
      request.requestType = RequestType.POST;
      request.endpoint = 'id-auth/v2/tokens';
      request.jsonBody = json.encode({
        'userId': mobileNumber,
        'userType': _userType,
      });
      request.customHeaders = {'Content-Type': 'application/json'};

      final response = await _client.standardRequest(request);
      if (response.statusCode == 200) {
        var tokenResponse = TokenResponse.fromJson(response.jsonResult!);
        _authManager.storeTokenInformation(
          tokenResponse.token!,
          'refreshToken',
          'expiresIn',
          mobileNumber!,
        );
        return tokenResponse;
      } else {
        CrayonPaymentLogger.logDebug(
            'Error = ${response.statusCode.toString()}');
        onErrorCallback(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      CrayonPaymentLogger.logDebug('Error = ${e.toString()}');
      onErrorCallback(e.toString());
      return null;
    }
  }
}

class CrayonPaymentAuthManager extends IAuthManager {
  static const _accessTokenKey = 'access_token';

  final SecureStorageService _secureStorageService;

  CrayonPaymentAuthManager(this._secureStorageService);

  @override
  Future<String?> getAccessToken() async {
    /*
      TODO:
        - Remove AuthManager in favour of this CrayonPaymentAuthManager
        - Remove the need for this variable newLoginJourney
        - Remove _getTemporaryToken()
     */
    if (newLoginJourney) {
      return 'Bearer ${await _getAccessToken()}';
    } else {
      return await _getTemporaryToken();
    }
  }

  Future<String> _getTemporaryToken() async {
    late Map<String, String> staticAuthMap;
    final path = 'assets/configuration/static_auth.json';
    final jsonString = await rootBundle.loadString(path);
    final res = json.decode(jsonString) as Map<String, dynamic>;
    staticAuthMap = Map<String, String>.from(res);
    return 'Bearer ${staticAuthMap['with_cards_auth']}';
  }

  @override
  Future<bool> get isUserAuthenticated async =>
      (await _getAccessToken()) != null;

  Future<String?> _getAccessToken() async =>
      await _secureStorageService.get(_accessTokenKey);

  Future _setAccessToken(String accessToken) async =>
      await _secureStorageService.set(
        _accessTokenKey,
        accessToken,
      );

  @override
  Future storeTokenInformation(
    String accessToken, [
    String? refreshToken,
    String? expiresIn,
    String? individualId,
  ]) async {
    _setAccessToken(accessToken);
  }

  @override
  Future clearAuthentication() async {
    await _secureStorageService.delete(
      _accessTokenKey,
    );
  }

  @override
  Future setUserDetail({String? authInfo, UserDetailsLabel? key}) async {
    await _secureStorageService.set(
      key!.name,
      authInfo,
    );
  }
}
