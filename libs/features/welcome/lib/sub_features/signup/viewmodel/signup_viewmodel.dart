class SignupViewModel {
  bool isValidNidaNumber(String nidaNumber) {
    // Actual Nida Validation is 20, Here in UI We Format the NIDA number with 3 dashes ("-"), so the length we check is 20+3 = 23.
    var valid = nidaNumber.length == 20;
    return valid;
  }

  bool isValidMobileNumber(String mobileNumber) {
    // Actual Mobile Validation is 9, Here in UI We Format the Mobile number with 2 Empty Space (" "), so the length we check is 9+2 = 11.

    var reg = RegExp(r'^(\+\d{1,3}[- ]?)?\d{9}$');
    var isValid = mobileNumber.length == 11;
    return isValid;
  }
}
