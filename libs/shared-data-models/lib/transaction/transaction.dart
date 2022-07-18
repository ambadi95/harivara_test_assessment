import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/transaction_status.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';
import 'transaction_category.dart';
import 'utils/transaction_build_methods.dart';

abstract class Transaction {
  final String? remarks;

  final String transId;

  final TransactionType type;

  final TransactionStatus status;

  final Amount balAfter;

  final Amount balBefore;

  final DateTime dateOfTrans;

  final double amount;

  final String mainTitleDisplayName;

  final TransactionCategory category;

  Transaction({
    required this.remarks,
    required this.transId,
    required this.type,
    required this.status,
    required this.balAfter,
    required this.balBefore,
    required this.dateOfTrans,
    required this.amount,
    required this.mainTitleDisplayName,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final transactionCategory;

    if (json['transactionCategory'] != null) {
      transactionCategory =
          TransactionCategory.fromString(json['transactionCategory']);
    } else {
      transactionCategory = TransactionCategory.notAvailable();
    }

    return transactionCategory.when(
      purchase: () => buildPurchaseTransaction(json),
      refund: () => buildRefundTransaction(json),
      addedFunds: () => buildAddFundsTransaction(json),
      receivedFunds: () => buildReceivedFundsTransaction(json),
      sentFunds: () => buildSentFundsTransaction(json),
      subscription: () => buildSubscriptionTransaction(json),
      p2m: () => buildP2MTransaction(json),
      notAvailable: () => buildNotAvailableTransaction(),
    );
  }

  @override
  String toString() {
    return category.toString();
  }
}
