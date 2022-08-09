import 'package:shared_data_models/passcode/passcode_verification_type.dart';

class PasscodeScreenArgs {
  final String title;
  final String description;
  final String destinationPath;
  final bool hasProgressBar;
  final int currentStep;
  final PassCodeVerificationType passCodeVerificationType;
  final bool isForgotPassword;
  final String initialPasscode;
  final String userType;


  PasscodeScreenArgs(
    this.title,
    this.description,
    this.destinationPath,
    this.hasProgressBar,
    this.currentStep,
    this.passCodeVerificationType,
    this.isForgotPassword,
    this.initialPasscode,
    this.userType,
  );
}
