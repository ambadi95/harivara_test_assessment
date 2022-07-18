import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/transaction.dart';

import '../transaction_category.dart';
import '../transaction_status.dart';
import '../transaction_type.dart';

abstract class P2PBaseTransaction extends Transaction {
  final String customerName;

  final String customerPhNo;

  P2PBaseTransaction({
    required this.customerName,
    required this.customerPhNo,
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
