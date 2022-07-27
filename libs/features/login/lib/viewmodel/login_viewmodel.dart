class LoginViewModel{
  bool isValidMobileNumber(String mobileNumber) {
    var reg = RegExp(r'^(\+\d{1,3}[- ]?)?\d{9}$');
    var isValid = reg.hasMatch(mobileNumber);
    return isValid;
  }
}