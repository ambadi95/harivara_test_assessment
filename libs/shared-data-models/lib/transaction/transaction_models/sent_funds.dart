import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/base_transactions/p2p_base_transaction.dart';

import '../transaction_category.dart';
import '../transaction_status.dart';
import '../transaction_type.dart';

class SentFunds extends P2PBaseTransaction {
  SentFunds({
    required String customerName,
    required String customerPhNo,
    required String? remarks,
    required String transId,
    required TransactionStatus status,
    required Amount balBefore,
    required Amount balAfter,
    required DateTime dateOfTrans,
    required double amount,
    required String mainTitleDisplayName,
  }) : super(
          customerName: customerName,
          customerPhNo: customerPhNo,
          remarks: remarks,
          transId: transId,
          type: TransactionType.debit(),
          status: status,
          balBefore: balBefore,
          balAfter: balAfter,
          dateOfTrans: dateOfTrans,
          amount: amount,
          mainTitleDisplayName: mainTitleDisplayName,
          category: TransactionCategory.sentFunds(),
        );
}
