class JwtTokenResponseData {
  String? jwttoken;

  JwtTokenResponseData({
    this.jwttoken,
  });
  JwtTokenResponseData.fromJson(Map<String, dynamic> json) {
    jwttoken = json['jwttoken']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['jwttoken'] = jwttoken;
    return data;
  }
}

class JwtTokenResponse {
  bool? status;
  String? code;
  String? message;
  JwtTokenResponseData? data;

  JwtTokenResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });
  JwtTokenResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code']?.toString();
    message = json['message']?.toString();
    data = (json['data'] != null)
        ? JwtTokenResponseData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
