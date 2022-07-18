import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/base_transactions/purchase_base_transaction.dart';
import 'package:shared_data_models/transaction/base_transactions/refund_base_transaction.dart';

import '../transaction_category.dart';
import '../transaction_status.dart';
import '../transaction_type.dart';

class Refund extends RefundBaseTransaction {
  Refund({
    required String? associatedTransactionId,
    required PurchaseBaseTransaction? originalTransaction,
    required String orderId,
    required String merchantName,
    required String mcc,
    required List<String>? refundId,
    required double processingFee,
    required double? discount,
    required double vat,
    required String? refundTransactionId,
    required String? remarks,
    required String transId,
    required TransactionType type,
    required TransactionStatus status,
    required Amount balBefore,
    required Amount balAfter,
    required DateTime dateOfTrans,
    required double amount,
    required String mainTitleDisplayName,
    required String? customerPhNo,
  }) : super(
          associatedTransactionId: associatedTransactionId,
          originalTransaction: originalTransaction,
          orderId: orderId,
          merchantName: merchantName,
          mcc: mcc,
          refundId: refundId,
          processingFee: processingFee,
          discount: discount,
          vat: vat,
          refundTransactionId: refundTransactionId,
          remarks: remarks,
          transId: transId,
          type: type,
          status: status,
          balBefore: balBefore,
          balAfter: balAfter,
          dateOfTrans: dateOfTrans,
          amount: amount,
          mainTitleDisplayName: mainTitleDisplayName,
          category: TransactionCategory.refund(),
          customerPhNo: customerPhNo,
        );

  Refund copyWith({
    PurchaseBaseTransaction? originalTransaction,
    String? associatedTransactionId,
    String? customerPhNo,
  }) {
    return Refund(
      associatedTransactionId:
          associatedTransactionId ?? this.associatedTransactionId,
      originalTransaction: originalTransaction ?? this.originalTransaction,
      orderId: orderId,
      merchantName: merchantName,
      mcc: mcc,
      refundId: refundId,
      processingFee: processingFee,
      discount: discount,
      vat: vat,
      refundTransactionId: refundTransactionId,
      remarks: remarks,
      transId: transId,
      type: type,
      status: status,
      balBefore: balBefore,
      balAfter: balAfter,
      dateOfTrans: dateOfTrans,
      amount: amount,
      mainTitleDisplayName: mainTitleDisplayName,
      customerPhNo: customerPhNo,
    );
  }
}
