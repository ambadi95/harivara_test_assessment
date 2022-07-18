import 'package:shared_data_models/otp/mobile_registration_type.dart';

class MobileScreenArgs {
  final String title;
  final String description;
  final String destinationPath;
  final bool hasProgressBar;
  final int currentStep;
  final bool canChangeCountry;
  final MobileRegistrationType mobileRegistrationType;
  final bool displayWarningMessage;

  MobileScreenArgs(
    this.title,
    this.description,
    this.destinationPath,
    this.hasProgressBar,
    this.currentStep,
    this.canChangeCountry,
    this.mobileRegistrationType,
    this.displayWarningMessage,
  );
}
