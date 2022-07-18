class BiometricPreference {
  BiometricPreference({
    signInTouchId,
    signInPalmId,
    signInFaceId,
    paymentTouchId,
    paymentPalmId,
    paymentFaceId,
    notificationsMethodsPush,
  });

  int? signInTouchId;
  int? signInPalmId;
  int? signInFaceId;
  int? paymentTouchId;
  int? paymentPalmId;
  int? paymentFaceId;

  BiometricPreference.fromJson(Map<String, dynamic> json) {
    signInTouchId = json['signInTouchId'] ?? 0;
    signInPalmId = json['signInPalmId'] ?? 0;
    signInFaceId = json['signInFaceId'] ?? 0;
    paymentTouchId = json['paymentTouchId'] ?? 0;
    paymentPalmId = json['paymentPalmId'] ?? 0;
    paymentFaceId = json['paymentFaceId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['signInTouchId'] = signInTouchId;
    _data['signInPalmId'] = signInPalmId;
    _data['signInFaceId'] = signInFaceId;
    _data['paymentTouchId'] = paymentTouchId;
    _data['paymentPalmId'] = paymentPalmId;
    _data['paymentFaceId'] = paymentFaceId;
    return _data;
  }

  void setSignInTouchId(int value) {
    signInTouchId = value;
  }

  void setSignInPalmId(int value) {
    signInPalmId = value;
  }

  void setSignInFaceId(int value) {
    signInFaceId = value;
  }

  void setPaymentTouchId(int value) {
    paymentTouchId = value;
  }

  void setPaymentPalmId(int value) {
    paymentPalmId = value;
  }

  void setPaymentFaceId(int value) {
    paymentFaceId = value;
  }

  int? getSignInTouchId() {
    return signInTouchId;
  }

  int? getSignInPalmId() {
    return signInPalmId;
  }

  int? getSignInFaceId() {
    return signInFaceId;
  }

  int? getPaymentTouchId() {
    return paymentTouchId;
  }

  int? getPaymentPalmId() {
    return paymentPalmId;
  }

  int? getPaymentFaceId() {
    return paymentFaceId;
  }
}
