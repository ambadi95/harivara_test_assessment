import 'package:flutter/material.dart';
import 'package:config/Config.dart';

class WelcomeScreenArgs {
  final String signUpDestination;
  final String signInDestination;
  final UserType userType;
  final bool isSigned;

  WelcomeScreenArgs(this.signUpDestination, this.signInDestination,
      this.userType, this.isSigned);
}
