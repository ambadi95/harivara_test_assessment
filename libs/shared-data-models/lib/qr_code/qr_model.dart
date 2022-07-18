import 'package:equatable/equatable.dart';

class QrModel extends Equatable {
  final String? name;
  final String? type;
  final String? logo;
  final String? contact;
  final String? merchantId;
  final String? location;
  final String? reDirectUrl;
  final String? transactionId;
  late final String? amount;
  final bool? isExpired;

  QrModel({
    this.name,
    this.type,
    this.logo,
    this.contact,
    this.merchantId,
    this.location,
    this.reDirectUrl,
    this.transactionId,
    this.amount,
    this.isExpired = false,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        name: json['name'],
        type: json['type'],
        logo: json['logo'],
        contact: json['contact'],
        merchantId: json['merchantId'],
        location: json['location'],
        reDirectUrl: json['reDirectUrl'],
        transactionId: json['transactionId'],
        amount: json['amount'],
        isExpired: json['isExpired'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['type'] = type;
    _data['logo'] = logo;
    _data['contact'] = contact;
    _data['merchantId'] = merchantId;
    _data['location'] = location;
    _data['reDirectUrl'] = reDirectUrl;
    _data['transactionId'] = transactionId;
    _data['amount'] = amount;
    _data['isExpired'] = isExpired;
    return _data;
  }

  QrModel copyWith({
    required String name,
    required String type,
    required String logo,
    required String contact,
    required String merchantId,
    required String location,
    required String reDirectUrl,
    required String transactionId,
    required String amount,
    required bool isExpired,
  }) {
    return QrModel(
      name: name,
      type: type,
      logo: logo,
      contact: contact,
      merchantId: merchantId,
      location: location,
      reDirectUrl: reDirectUrl,
      transactionId: transactionId,
      amount: amount,
      isExpired: isExpired,
    );
  }

  @override
  List<Object?> get props => [
        name,
        type,
        logo,
        contact,
        merchantId,
        location,
        reDirectUrl,
        transactionId,
        amount,
        isExpired
      ];
}
