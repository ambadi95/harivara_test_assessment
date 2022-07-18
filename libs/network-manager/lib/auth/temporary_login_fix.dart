import 'dart:convert';

import 'package:core/retrievers/app_info_retriever.dart';
import 'package:flutter/services.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/login_model/login_model.dart';

class TemporaryLoginFix {
  late Map<String, String> _staticAuthMap;
  final AppInfoRetriever _appInfoRetriever;

  TemporaryLoginFix(this._appInfoRetriever) {
    _loadStaticAuth();
  }

  Future<LoginModel?> tryLogin(String email, String password) async {
    final passwordForEmail = _staticAuthMap[email];
    final app = await _appInfoRetriever.getAppInfo;
    if (passwordForEmail == null || passwordForEmail != password) {
      return null;
    }
    if (email.contains('7')) {
      return LoginModel(
        email: email,
        idToken: _staticAuthMap['submit_card'],
      );
    }
    if (email.contains('8')) {
      return LoginModel(
        email: email,
        idToken: _staticAuthMap['test8_token'],
      );
    }
    if (email.contains('9')) {
      return LoginModel(
        email: email,
        idToken: _staticAuthMap['test9_token'],
      );
    }
    if (email.contains('1') || email.contains('2') || email.contains('3')) {
      return LoginModel(
        email: email,
        idToken: _staticAuthMap['with_cards_auth'],
      );
    }
    return app.appType.when(
      merchant: () => LoginModel(
        email: email,
        idToken: _staticAuthMap['merchant_token'],
      ),
      customer: () => LoginModel(
        email: email,
        idToken: _staticAuthMap['without_cards_auth'],
      ),
    );
  }

  Future<void> _loadStaticAuth() async {
    final path = 'assets/configuration/static_auth.json';
    final jsonString = await rootBundle.loadString(path);
    final res = json.decode(jsonString) as Map<String, dynamic>;
    _staticAuthMap = Map<String, String>.from(res);
  }
}

class TemporaryAuthManager extends IAuthManager {
  String? _authToken;

  @override
  Future<String?> getAccessToken() async {
    return _authToken;
  }

  @override
  Future<bool> isUserAuthenticated() async => _authToken != null;

  @override
  Future storeTokenInformation(
    String accessToken, [
    String? refreshToken,
    String? expiresIn,
    String? individualId,
  ]) async {
    _authToken = accessToken;
  }

  @override
  Future clearAuthentication() async {
    _authToken = null;
  }
}
