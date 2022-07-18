import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/transaction.dart';
import 'package:shared_data_models/transaction/transaction_category.dart';
import 'package:shared_data_models/transaction/transaction_status.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';

class NotAvailableTransaction extends Transaction {
  NotAvailableTransaction()
      : super(
          remarks: 'N/A',
          transId: 'N/A',
          type: TransactionType.credit(),
          status: TransactionStatus.failed(),
          balBefore: Amount(0.0, 'SAR'),
          balAfter: Amount(0.0, 'SAR'),
          dateOfTrans: DateTime.now(),
          amount: 0.0,
          mainTitleDisplayName: 'N/A',
          category: TransactionCategory.notAvailable(),
        );
}
