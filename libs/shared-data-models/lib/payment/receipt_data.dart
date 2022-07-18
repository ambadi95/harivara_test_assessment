class ReceiptData {
  ReceiptData({
    required this.orderValue,
    required this.discountPercentage,
    required this.discountValue,
    required this.vatPercentage,
    required this.vatValue,
    required this.orderID,
    required this.transferId,
  });

  late final String orderValue;
  late final String discountPercentage;
  late final String discountValue;
  late final String vatPercentage;
  late final String vatValue;
  late final String orderID;
  late final String transferId;

  ReceiptData.fromJson(Map<String, dynamic> json) {
    orderValue = json['orderValue'];
    discountPercentage = json['discountPercentage'];
    discountValue = json['discountValue'];
    vatPercentage = json['vatPercentage'];
    vatValue = json['vatValue'];
    orderID = json['orderID'];
    transferId = json['transferId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['orderValue'] = orderValue;
    _data['discountPercentage'] = discountPercentage;
    _data['discountValue'] = discountValue;
    _data['vatPercentage'] = vatPercentage;
    _data['vatValue'] = vatValue;
    _data['orderID'] = orderID;
    _data['transferId'] = transferId;

    return _data;
  }
}
