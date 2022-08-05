import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IPasscodeService {
  static const loginWithPasscodeIdentifier = 'loginWithPasscode';
  static const verifyCurrentPasscodeIdentifier = 'verifyCurrentPasscode';
  static const merchantverifyCurrentPasscodeIdentifier =
      'merchantverifyCurrentPasscode';
  static const requestOtpForResetPasswordIdentifier =
      'requestOtpForResetPassword';
  static const changePasscodeIdentifier = 'changePasscode';
  static const merchantChangePasscodeIdentifier = 'merchantChangePasscode';
  static const resetPasscodeIdentifier = 'resetPasscode';
  static const createMerchantPasscodeIdentifier = 'createMerchantPasscode';
  static const paymentWithPasscodeIdentifier = 'paymentWithPasscode';
  static const blockUserIdentifier = 'block';

  Future<StandardRequest> loginWithPasscode(
    String mobileNo,
    String passcode,
    String language,
  );

  Future<StandardRequest> resetPasscode(
    String confirmPassword,
    String mobileNo,
    String newPassword,
  );

  Future<StandardRequest> changePasscode(
    String confirmPassword,
    String mobileNo,
    String newPassword,
    String oldPassword,
  );

  Future<StandardRequest> merchantChangePasscode(
    String confirmLoginKey,
    String customerId,
    String newLoginKey,
    String oldLoginKey,
  );

  Future<StandardRequest> verifyCurrentPasscode(
    String mobileNo,
    String passcode,
    String language,
  );

  Future<StandardRequest> merchantVerifyCurrentPasscode(
    String mobileNo,
    String passcode,
    String language,
  );

  Future<StandardRequest> requestOtpForResetPassword(
    String flag,
    String mobileNo,
  );

  Future<StandardRequest> paymentWithPasscode(Map<String, dynamic> requestData);

  Future<StandardRequest> createMerchantPasscode(
    String confirmNewPassword,
    String mobileNo,
    String newPassword,
    String oldPassword,
  );

  Future<StandardRequest> blockUser(String mobileNumber);
}

class PasscodeService extends IPasscodeService {
  @override
  Future<StandardRequest> blockUser(String mobileNumber) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.jsonBody = json.encode({'userIdentifier': mobileNumber});
    request.endpoint = 'customer/customers/v1.0/customer/block/$mobileNumber';
    request.customHeaders = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app'
    };
    return request;
  }

  @override
  Future<StandardRequest> loginWithPasscode(
    String mobileNo,
    String passcode,
    String language,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer/customers/v2.0/identity';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };
    request.jsonBody = json.encode(
      {'language': language, 'mobileNo': mobileNo, 'password': passcode},
    );
    return request;
  }

  @override
  Future<StandardRequest> requestOtpForResetPassword(
    String flag,
    String mobileNo,
  ) async {
    print(flag);

    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint =
        'otpapi/util/v1.0/otp?otpServiceCode=$flag&mobileNo=$mobileNo';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };

    return request;
  }

  @override
  Future<StandardRequest> createMerchantPasscode(
    String confirmNewPassword,
    String mobileNo,
    String newPassword,
    String oldPassword,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent/merchants/v2.0/agent/${mobileNo}/password';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app'
    };
    request.jsonBody = jsonEncode({
      'confirmNewPassword': confirmNewPassword,
      'mobileNo': mobileNo,
      'newPassword': newPassword,
      'oldPassword': oldPassword
    });
    return request;
  }

  @override
  Future<StandardRequest> paymentWithPasscode(
    Map<String, dynamic> requestData,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'paymentconfirm/wallets/v2.0/pay';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> verifyCurrentPasscode(
    String mobileNo,
    String passcode,
    String language,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer/customers/v2.0/identity';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };
    request.jsonBody = json.encode(
      {'language': language, 'mobileNo': mobileNo, 'password': passcode},
    );
    return request;
  }

  @override
  Future<StandardRequest> merchantVerifyCurrentPasscode(
    String mobileNo,
    String passcode,
    String language,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent/merchants/v2.0/identity';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app'
    };
    //userId need to change
    var data = {
      'language': language,
      'mobileNo': mobileNo,
      'password': passcode
    };
    print(data.toString());
    request.jsonBody = json.encode(data);
    return request;
  }

  @override
  Future<StandardRequest> changePasscode(
    String confirmPassword,
    String mobileNo,
    String newPassword,
    String oldPassword,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer/customers/v2.0/customer/$mobileNo/password';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };
    request.jsonBody = json.encode(
      {
        'confirmNewPassword': confirmPassword,
        'mobileNo': mobileNo,
        'newPassword': newPassword,
        'oldPassword': oldPassword
      },
    );
    return request;
  }

  @override
  Future<StandardRequest> merchantChangePasscode(
    String confirmPassword,
    String mobileNo,
    String newPassword,
    String oldPassword,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'agent/merchants/v2.0/agent/$mobileNo/password';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };

    request.jsonBody = json.encode(
      {
        'confirmNewPassword': confirmPassword,
        'mobileNo': mobileNo,
        'newPassword': newPassword,
        'oldPassword': oldPassword
      },
    );
    return request;
  }

  @override
  Future<StandardRequest> resetPasscode(
    String confirmPassword,
    String mobileNo,
    String newPassword,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer/customers/v1.0/customer/reset-passcode';
    request.customHeaders = {
      'Content-Type': 'application/json',
      'x-CrayonPayment-channel': 'app',
    };
    request.jsonBody = json.encode(
      {
        'confirmPassword': confirmPassword,
        'mobileNo': mobileNo,
        'newPassword': newPassword,
      },
    );
    return request;
  }
}
