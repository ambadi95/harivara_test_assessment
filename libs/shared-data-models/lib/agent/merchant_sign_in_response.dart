import 'package:shared_data_models/signup/create_response.dart';

class MerchantSignInResponse extends CreateResponse {
  final String? language;
  final String? lastLoginTime;
  final String? serviceFlow;

  final Token? token;
  final String? transactionId;
  final String? txnStatus;
  final dynamic errors;
  final String? transactionTimeStamp;
  final String? errorCode;
  final String? traceId;
  final String? step;
  final String? errorUserMsg;

  MerchantSignInResponse({
    this.language,
    this.lastLoginTime,
    String? message,
    this.serviceFlow,
    String? serviceRequestId,
    String? status,
    this.token,
    this.transactionId,
    this.txnStatus,
    String? mfsTenantId,
    this.errors,
    this.transactionTimeStamp,
    this.errorCode,
    this.traceId,
    this.step,
    this.errorUserMsg,
  }) : super(
          message: message,
          status: status,
          serviceRequestId: serviceRequestId,
          userId: mfsTenantId,
        );

  factory MerchantSignInResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      MerchantSignInResponse(
        language: json['language'],
        lastLoginTime: json['lastLoginTime'],
        message: json['message'],
        serviceFlow: json['serviceFlow'],
        serviceRequestId: json['serviceRequestId'],
        status: json['status'],
        token: json['token'],
        transactionId: json['transactionId'],
        txnStatus: json['txnStatus'],
        mfsTenantId: json['mfsTenantId'],
        errors: json['errors'],
        transactionTimeStamp: json['transactionTimeStamp'],
        errorCode: json['errorCode'],
        traceId: json['traceId'],
        step: json['step'],
        errorUserMsg: json['errorUserMsg'],
      );
}

class Token {
  final String? access_token;
  final String? expires_in;
  final String? refresh_token;

  const Token({
    this.access_token,
    this.expires_in,
    this.refresh_token,
  });

  factory Token.fromJson(
    Map<String, dynamic> json,
  ) =>
      Token(
        access_token: json['access_token'],
        expires_in: json['expires_in'],
        refresh_token: json['refresh_token'],
      );
}

// class Errors {
//   final String? code;
//   final String? message;
//
//   const Errors({
//     this.code,
//     this.message,
//   });
//
//   factory Errors.fromJson(
//     Map<String, dynamic> json,
//   ) =>
//       Errors(
//         code: json['code'],
//         message: json['message'],
//       );
// }
