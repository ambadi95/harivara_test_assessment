enum LoginType {

  passcode,
  biometric
}

extension LoginTypeExtension on LoginType {
  int get value {
    switch (this) {
      case LoginType.passcode:
        return 1;
      case LoginType.biometric:
        return 2;
      default:
        return 0;

    }
  }
}




