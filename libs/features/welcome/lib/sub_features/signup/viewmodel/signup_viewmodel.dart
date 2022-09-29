class SignupViewModel {
  bool isValidNidaNumber(String nidaNumber) {
    print(nidaNumber);
    var valid = nidaNumber.length == 23;
    return valid;
  }

  bool isValidMobileNumber(String mobileNumber) {
    var reg = RegExp(r'^(\+\d{1,3}[- ]?)?\d{9}$');
    var isValid = mobileNumber.length == 11;
    return isValid;
  }
}
