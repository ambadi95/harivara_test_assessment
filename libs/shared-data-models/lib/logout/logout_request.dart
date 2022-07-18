class LogoutRequest{
  String? bearerCode;
  String? language;
  String? mobileNo;

  LogoutRequest({this.bearerCode, this.language, this.mobileNo});

  LogoutRequest.fromJson(Map<String, dynamic> json) {
    bearerCode = json['bearerCode'];
    language = json['language'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bearerCode'] = bearerCode;
    data['language'] = language;
    data['mobileNo'] = mobileNo;
    return data;
  }
}
