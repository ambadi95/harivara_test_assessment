class ScanQRCodeRequest {
  final String customerId;
  final int deviceId;
  final String imei1;
  final String imei2;

  const ScanQRCodeRequest(this.customerId, this.deviceId, this.imei1, this.imei2);

  factory ScanQRCodeRequest.fromJson(Map<String, dynamic> json) => ScanQRCodeRequest(
      json['customerId'],
      json['deviceId'],
      json['imei1'],
      json['imei2']
  );

  Map<String, dynamic> toJson(ScanQRCodeRequest request) {
    return {
      'customerId': request.customerId,
      'deviceId': request.deviceId,
      'imei1': request.imei1,
      'imei2' : request.imei2
    };
  }
}
