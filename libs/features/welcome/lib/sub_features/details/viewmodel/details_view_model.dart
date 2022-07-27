class DetailsViewModel{

  bool isValidName(String name) {
    var reg = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    var isValid = reg.hasMatch(name);
    return isValid;
  }

  bool isValidEmailId(String emailId) {
    var reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var isValid = reg.hasMatch(emailId);
    return isValid;
  }

  bool isValidPoBox(String poBox) {
    return poBox.isNotEmpty;
  }
  
}