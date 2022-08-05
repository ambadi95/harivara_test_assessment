import 'dart:convert';

import 'package:core/logging/logger.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:flutter/services.dart';
import 'package:network_manager/auth/common.dart';
import 'package:shared_data_models/auth/auth_detail.dart';

abstract class IAuthManager {
  /// Retrieves the access token for the currently authenticated user.
  Future<String?> getAccessToken();

  /// Determines whether or not the user has already authenticated with the platform.
  Future<bool> get isUserAuthenticated;

  Future clearAuthentication();

  /// Stores the relevant token information that can be retrieved from src or registration
  /// calls.
  Future storeTokenInformation(
    String accessToken,
    String refreshToken,
    String expiresIn,
    String individualId,
  );

  Future setUserDetail({String? authInfo, UserDetailsLabel? key});
}

class AuthManager implements IAuthManager {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _expiryDateKey = 'expiry_date';
  static const _individualIdKey = 'individual_id';
  static const AuthDetail authInfo = AuthDetail();

  // the expiry buffer is to mitigate latency from the connection between client and server.
  // when a token is generated so is its expiry time in seconds.
  static const _expiryBuffer = 30;

  final SecureStorageService _secureStorageService;

  AuthManager(this._secureStorageService);

  @override
  Future<bool> get isUserAuthenticated async {
    final token = await getAccessToken();
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    /*
        TODO:
          - Remove this AuthManager in favour of CrayonPaymentAuthManager
          - Before removing we should extract all useful logic written here
     */
    if (newLoginJourney) {
      CrayonPaymentLogger.logInfo('Attempting to retrieve access token');
      // check the user is authenticated
      if (!await isUserAuthenticated) {
        CrayonPaymentLogger.logInfo(
            'User has not yet authenticated, please src.');
        return null;
      }
      // check access token has not expired
      final expiryDateTime = await _getExpireTime();
      if (DateTime.now().toUtc().isAfter(expiryDateTime!)) {
        // access token has expired, need to refresh
        CrayonPaymentLogger.logDebug(
          'Access token has expired, refreshing using refresh token.',
        );
        await _refreshAccessToken();
      }
      CrayonPaymentLogger.logDebug('Access token is valid.');
      return await _getAccessToken();
    } else {
      final tempToken = await _getTemporaryToken();
      return 'Bearer $tempToken';
    }
  }

  Future _refreshAccessToken() async {
    // here we would use the refresh token to renew the access token and
    // store it inside of the secure storage service.
    // if we cannot refresh the access token we should throw an exception to delegate
    // the responsibility of popping up the src prompt to the user to the calling method.
    throw UnimplementedError();
  }

  // retrieve necessary tokens or expiry times
  Future<String?> _getAccessToken() async =>
      await _secureStorageService.get(_accessTokenKey);

  Future<String?> _getRefreshToken() async =>
      await _secureStorageService.get(_refreshTokenKey);

  Future<DateTime?> _getExpireTime() async {
    final expiryDateStr = await _secureStorageService.get(_expiryDateKey);
    if (expiryDateStr.isNullOrEmpty()) {
      return null;
    }
    return DateTime.parse(expiryDateStr!).toUtc();
  }

  Future _setAccessToken(String accessToken) async =>
      await _secureStorageService.set(
        _accessTokenKey,
        accessToken,
      );

  @override
  Future setUserDetail({String? authInfo, UserDetailsLabel? key}) async {
    await _secureStorageService.set(
      key!.name,
      authInfo,
    );
  }

  Future<String?> _getUserInfo(UserDetailsLabel key) async =>
      await _secureStorageService.get(key.name);

  Future _setRefreshToken(String refreshToken) async =>
      await _secureStorageService.set(
        _refreshTokenKey,
        refreshToken,
      );

  Future _setExpireTime(String expiresIn) async {
    final expiresInNumber = int.parse(expiresIn);
    final expiresDateTime = DateTime.now()
        .add(Duration(seconds: expiresInNumber - _expiryBuffer))
        .toUtc();
    await _secureStorageService.set(_expiryDateKey, expiresDateTime.toString());
  }

  Future _setIndividualId(String individualId) async {
    await _secureStorageService.set(_individualIdKey, individualId);
  }

  @override
  Future storeTokenInformation(
    String accessToken,
    String refreshToken,
    String expiresIn,
    String individualId,
  ) async {
    await _setAccessToken(accessToken);
    await _setRefreshToken(refreshToken);
    await _setExpireTime(expiresIn);
    await _setIndividualId(individualId);
  }

  Future<String> _getTemporaryToken() async {
    late Map<String, String> staticAuthMap;
    final path = 'assets/configuration/static_auth.json';
    final jsonString = await rootBundle.loadString(path);
    final res = json.decode(jsonString) as Map<String, dynamic>;
    staticAuthMap = Map<String, String>.from(res);
    return staticAuthMap['with_cards_auth'] as String;
  }

  @override
  Future clearAuthentication() async {
    await _secureStorageService.delete(
      _accessTokenKey,
    );
  }
}

// errors associated with authentication
class NotAuthenticatedError extends Error {}
