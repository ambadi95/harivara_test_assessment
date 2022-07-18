import 'package:core/storage/secure_storage/secure_storage_service.dart';

abstract class IUserManager {
  Future<String?> getUserId();

  Future<String?> getUserMobile();

  Future<String?> getUserEmail();

  Future<String?> getUserPasscode();

  Future<String?> getWalletId();

  Future<String?> getUserName();

  Future<void> setUserId(String? userId);

  Future<void> signOut();

  Future<void> setUserMobile(String? mobile);

  Future<void> setUserEmail(String? email);

  Future<void> setWalletId(String? walletId);

  Future<void> setPasscode(String? mobile);

  Future<void> setUserName(String? userName);

  Future<void> clearPasscode();
}

class UserManager implements IUserManager {
  static const _userIdKey = 'userId';
  static const _walletIdKey = 'walletId';
  static const _userMobileKey = 'userMobile';
  static const _passcodeKey = 'passcode';
  static const _userEmailKey = 'userEmail';
  static const _userNameKey = 'userName';

  final SecureStorageService _secureStorageService;

  UserManager(this._secureStorageService);

  @override
  Future<String?> getUserId() async => await _getUserId();

  @override
  Future<String?> getWalletId() async => await _getWalletId();

  @override
  Future<String?> getUserMobile() async => await _getMobile();

  @override
  Future<String?> getUserPasscode() async => await _getPasscode();

  @override
  Future<String?> getUserEmail() async => await _getEmail();

  @override
  Future<String?> getUserName() async => await _getUserName();

  @override
  Future setWalletId(String? walletId) async {
    await _setWalletId(walletId);
  }

  @override
  Future<void> setUserMobile(String? mobile) async {
    await _setMobileNumber(mobile);
  }

  @override
  Future setUserId(String? userId) async {
    await _setUserId(userId);
  }

  @override
  Future<void> setPasscode(String? passcode) async {
    await _setPasscode(passcode);
  }

  @override
  Future<void> setUserEmail(String? email) async {
    await _setEmail(email);
  }

  @override
  Future<void> setUserName(String? userName) async {
    await _setUserName(userName);
  }

  @override
  Future<void> clearPasscode() async {
    await _secureStorageService.delete(_passcodeKey);
  }

  Future _setUserId(String? userId) async => await _secureStorageService.set(
        _userIdKey,
        userId,
      );

  Future _setWalletId(String? walletId) async {
    await _secureStorageService.set(_walletIdKey, walletId);
  }

  Future<String?> _getWalletId() async =>
      await _secureStorageService.get(_walletIdKey);

  Future _setMobileNumber(String? mobile) async {
    await _secureStorageService.set(_userMobileKey, mobile);
  }

  Future _setPasscode(String? passcode) async {
    await _secureStorageService.set(_passcodeKey, passcode);
  }

  Future _setEmail(String? email) async {
    await _secureStorageService.set(_userEmailKey, email);
  }

  Future _setUserName(String? userName) async {
    await _secureStorageService.set(_userNameKey, userName);
  }

  Future<String?> _getUserId() async =>
      await _secureStorageService.get(_userIdKey);

  @override
  Future<void> signOut() async => await _secureStorageService.deleteAll();

  Future<String?> _getMobile() async =>
      await _secureStorageService.get(_userMobileKey);

  Future<String?> _getPasscode() async =>
      await _secureStorageService.get(_passcodeKey);

  Future<String?> _getEmail() async =>
      await _secureStorageService.get(_userEmailKey);

  Future<String?> _getUserName() async =>
      await _secureStorageService.get(_userNameKey);
}
