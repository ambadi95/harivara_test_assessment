class ScanQRCodeViewModel {

  bool isValidIMEINumber(String imeiNumber) {
    var reg = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    var isValid = imeiNumber.length == 16;
    return isValid;
  }


}