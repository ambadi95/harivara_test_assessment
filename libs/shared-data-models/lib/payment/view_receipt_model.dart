import 'package:shared_data_models/payment/merchant_details.dart';
import 'package:shared_data_models/payment/receipt_data.dart';

class ViewReceiptModel {
  ViewReceiptModel({
    required this.merchantDetails,
    required this.receiptData,
    required this.paymentMethod,
    required this.paymentDateTime,
    required this.codeType,
    required this.status,
    required this.postBalance,
    required this.preBalance,
    required this.remarks,
    required this.entryType,
    required this.serviceName,
  });

  late final MerchantDetails merchantDetails;
  late final ReceiptData receiptData;
  late final String paymentMethod;
  late final String paymentDateTime;
  late final String codeType;
  late final String status;
  late final dynamic postBalance;
  late final dynamic preBalance;
  late final String remarks;
  late final String entryType;
  late final String serviceName;

  ViewReceiptModel.fromJson(Map<String, dynamic> json) {
    merchantDetails = MerchantDetails.fromJson(json['merchantDetails']);
    receiptData = ReceiptData.fromJson(json['receiptData']);
    paymentMethod = json['paymentMethod'];
    paymentDateTime = json['paymentDateTime'];
    status = json['status'];
    codeType = json['codeType'];
    remarks = json['remarks'];
    postBalance = json['postBalance'];
    preBalance = json['preBalance'];
    entryType = json['entryType'];
    serviceName = json['serviceName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['merchantDetails'] = merchantDetails.toJson();
    _data['receiptData'] = receiptData.toJson();
    _data['paymentMethod'] = paymentMethod;
    _data['paymentDateTime'] = paymentDateTime;
    _data['status'] = status;
    _data['codeType'] = codeType;
    _data['remarks'] = remarks;
    _data['postBalance'] = postBalance;
    _data['preBalance'] = preBalance;
    _data['entryType'] = entryType;
    _data['serviceName'] = serviceName;
    return _data;
  }
}
