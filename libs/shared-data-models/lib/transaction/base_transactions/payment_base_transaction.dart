import 'package:shared_data_models/amount/amount.dart';

import '../transaction.dart';
import '../transaction_category.dart';
import '../transaction_status.dart';
import '../transaction_type.dart';

abstract class PaymentBaseTransaction extends Transaction {
  final String orderId;

  final String merchantName;

  final String mcc;

  final List<String>? refundId;

  final double processingFee;

  final double? discount;

  final double vat;

  final String? refundTransactionId;

  PaymentBaseTransaction({
    required this.orderId,
    required this.merchantName,
    required this.mcc,
    required this.refundId,
    required this.processingFee,
    required this.discount,
    required this.vat,
    required this.refundTransactionId,
    required String? remarks,
    required String transId,
    required TransactionType type,
    required TransactionStatus status,
    required Amount balBefore,
    required Amount balAfter,
    required DateTime dateOfTrans,
    required double amount,
    required String mainTitleDisplayName,
    required TransactionCategory category,
  }) : super(
          remarks: remarks,
          transId: transId,
          type: type,
          status: status,
          balBefore: balBefore,
          balAfter: balAfter,
          dateOfTrans: dateOfTrans,
          amount: amount,
          mainTitleDisplayName: mainTitleDisplayName,
          category: category,
        );
}
