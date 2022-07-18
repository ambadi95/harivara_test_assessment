class PaymentResponse {
  String? totalRecords;
  String? serviceRequestId;
  List<dynamic>? transactions;

  PaymentResponse({
    this.totalRecords,
    this.serviceRequestId,
    this.transactions,
  });

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    totalRecords = json['totalRecords'];
    serviceRequestId = json['serviceRequestId'];
    transactions = json['transactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalRecords'] = totalRecords;
    data['serviceRequestId'] = serviceRequestId;
    data['transactions'] = transactions;
    return data;
  }
}
