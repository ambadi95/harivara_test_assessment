import 'otp_verification_type.dart';
import 'package:config/Config.dart';

class OtpScreenArgs {
  final String title;
  final String description;
  final String destinationPath;
  final bool hasProgressBar;
  final int currentStep;
  final OtpVerificationType otpVerificationType;
  final String refId;
  final int otpNumber;
  final String phoneNumber;
  final bool isResetPasscode;
  final UserType userType;
  final String event;
  final String nidaNumber;
  final bool isForUpdate;


  OtpScreenArgs(
    this.title,
    this.description,
    this.destinationPath,
    this.hasProgressBar,
    this.currentStep,
    this.otpVerificationType,
    this.refId,
    this.otpNumber,
    this.phoneNumber,
    this.isResetPasscode,
    this.userType,
      this.event,
      this.nidaNumber,
      this.isForUpdate
  );
}
