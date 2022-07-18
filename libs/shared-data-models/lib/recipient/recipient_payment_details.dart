import 'package:equatable/equatable.dart';
import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/auth/auth_details.dart';
import 'package:shared_data_models/payment/payment_context_type.dart';
import 'package:shared_data_models/recipient/receipient_details.dart';
import 'package:shared_data_models/transaction/transaction_initiator_type.dart';

class RecipientPaymentDetails extends Equatable {
  final String? note;
  final String? reference;
  final String? dateTime;
  final AuthDetails? authDetails;
  final PaymentContextType? paymentContextType;
  final RecipientDetails receiver;
  final RecipientDetails? sender;
  final Amount transactionAmount;
  final TransactionInitiatorType? transactionInitiatorType;

  const RecipientPaymentDetails({
    this.note,
    this.reference,
    this.dateTime,
    this.authDetails,
    this.paymentContextType,
    required this.receiver,
    this.sender,
    required this.transactionAmount,
    this.transactionInitiatorType,
  });

  RecipientPaymentDetails copyWith({
    String? note,
    String? reference,
    String? dateTime,
    AuthDetails? authDetails,
    PaymentContextType? paymentContextType,
    RecipientDetails? receiver,
    RecipientDetails? sender,
    Amount? transactionAmount,
    TransactionInitiatorType? transactionInitiatorType,
  }) {
    return RecipientPaymentDetails(
      note: note ?? this.note,
      reference: reference ?? this.reference,
      dateTime: dateTime ?? this.dateTime,
      authDetails: authDetails ?? this.authDetails,
      paymentContextType: paymentContextType ?? this.paymentContextType,
      receiver: receiver ?? this.receiver,
      sender: sender ?? this.sender,
      transactionAmount: transactionAmount ?? this.transactionAmount,
      transactionInitiatorType:
          transactionInitiatorType ?? this.transactionInitiatorType,
    );
  }

  factory RecipientPaymentDetails.fromJson(Map<String, dynamic> responseDate) {
    final json = responseDate['inititatePaymentTransferP2P'];
    return RecipientPaymentDetails(
      note: json['note'],
      reference: json['reference'],
      dateTime: json['dateTime'],
      authDetails: json['authDetails'] != null
          ? AuthDetails.fromJson(json['authDetails'])
          : null,
      paymentContextType: json['paymentContextType'] != null
          ? PaymentContextType.fromString(json['paymentContextType'])
          : null,
      receiver: RecipientDetails.fromJson(json['receiver']),
      sender: json['sender'] != null
          ? RecipientDetails.fromJson(json['sender'])
          : null,
      transactionAmount: Amount.fromJson(json['amount']),
      transactionInitiatorType: json['transactionInitiatorType'] != null
          ? TransactionInitiatorType.fromString(
              json['transactionInitiatorType'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'options': {
        'note': note,
        'authDetails':
            authDetails != null ? authDetails?.toJson(authDetails!) : null,
        'paymentContextType': paymentContextType.toString(),
        'receiver': receiver.toJson(receiver),
        'sender': sender != null ? sender?.toJson(sender!) : null,
        'transactionAmount': transactionAmount.toJson(),
        'transactionInitiatorType': transactionInitiatorType.toString(),
      }
    };
  }

  @override
  List<Object?> get props => [
        note,
        reference,
        dateTime,
        authDetails,
        paymentContextType,
        receiver,
        sender,
        transactionAmount,
        transactionInitiatorType,
      ];
}
