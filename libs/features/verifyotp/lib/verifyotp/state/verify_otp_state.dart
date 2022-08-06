import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/otp/otp_verification_type.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

part 'verify_otp_state.freezed.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initialState() = InitialState;

  const factory VerifyOtpState.ready({
    required BuildContext context,
    required OtpVerificationType otpVerificationType,
    required String pageTitle,
    required String pageDescription,
    required String initialPasscode,
    required String currentPasscode,
    required int passcodeLength,
    required String destinationPath,
    required int attemptsRemain,
    required bool attemptsRemainFlag,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = VerifyOtpStateReady;
}
