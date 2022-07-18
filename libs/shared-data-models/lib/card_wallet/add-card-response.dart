import 'package:shared_data_models/payment/payment_status.dart';

class AddCardResponse {
  String? cardId;
  int? walletId;
  String? payment3dSecureUrl;
  final PaymentStatus? paymentStatus;

  AddCardResponse({this.cardId, this.walletId,this.payment3dSecureUrl,this.paymentStatus});

  factory AddCardResponse.fromJson(Map<String, dynamic> json) {
    final result = AddCardResponse(
      cardId: json['cardId'] as String,
      payment3dSecureUrl: json['payment3dSecureUrl'] as String?,
      walletId: json['walletId'] as int,
      paymentStatus: json['paymentStatus'] != null
          ? PaymentStatus.fromString(json['paymentStatus'])
          : PaymentStatus.voidStatus(),
    );
    return result;
  }
}
