class SignupViewModel {
  bool isValidNidaNumber(String nidaNumber) {
    var valid = nidaNumber.length == 20;
    return valid;
  }

  bool isValidMobileNumber(String mobileNumber) {

    var reg = RegExp(r'^(\+\d{1,3}[- ]?)?\d{9}$');
    var isValid = mobileNumber.length == 9;
    return isValid;
  }
}
