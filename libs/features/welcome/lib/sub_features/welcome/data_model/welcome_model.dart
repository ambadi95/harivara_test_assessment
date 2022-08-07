import 'package:flutter/material.dart';

class WelcomeScreenArgs {
  final String signUpDestination;
  final String signInDestination;
  final String userType;
  final bool isSigned;

  WelcomeScreenArgs(this.signUpDestination, this.signInDestination,
      this.userType, this.isSigned);
}
