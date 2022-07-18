import 'package:shared_data_models/payment/payment_status.dart';

class AddFundsResponse {
  final String chargeId;
  final PaymentStatus paymentStatus;
  final String? payment3dSecureUrl;

  AddFundsResponse(this.chargeId, this.paymentStatus, this.payment3dSecureUrl);

  factory AddFundsResponse.fromJson(Map<String, dynamic> json) =>
      AddFundsResponse(
        json['paymentId'] as String,
        json['paymentStatus'] != null
            ? PaymentStatus.fromString(json['paymentStatus'])
            : PaymentStatus.voidStatus(),
        json['payment3dSecureUrl'],
      );
}
