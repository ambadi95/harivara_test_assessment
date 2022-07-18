import 'package:shared_data_models/passcode/passcode_response_message.dart';
import 'package:shared_data_models/passcode/passcode_response_type.dart';

class VerifyPasscodeResponse {
  final int? statusCode;
  final PasscodeResponseType? status;
  final PasscodeResponseMessage? message;

  const VerifyPasscodeResponse(this.statusCode, this.status, this.message);

  factory VerifyPasscodeResponse.fromJson(Map<String, dynamic> json) =>
      VerifyPasscodeResponse(
        json['statusCode'],
        json['status'] != null
            ? PasscodeResponseType.fromString(json['status'])
            : null,
        json['message'] != null
            ? PasscodeResponseMessage.fromString(json['message'])
            : null,
      );

  bool checkResponse() {
    if (status != null && message != null) {
      if (status is PasscodeResponseSuccess &&
          message is PasscodeMessageLoginSuccess) {
        return true;
      }
    }
    return false;
  }

  bool checkStatus() {
    if (status != null) {
      if (status is PasscodeResponseSuccess) {
        return true;
      }
    }
    return false;
  }
}
