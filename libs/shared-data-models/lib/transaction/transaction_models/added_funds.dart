import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/card_wallet/card_brand.dart';
import 'package:shared_data_models/transaction/transaction.dart';
import 'package:shared_data_models/transaction/transaction_category.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';

import '../transaction_status.dart';

class AddedFunds extends Transaction {
  final String last4;
  final double? processingFee;
  final CardBrand brand;
  final String nickName;

  AddedFunds({
    required this.last4,
    required this.processingFee,
    required this.brand,
    required this.nickName,
    required String? remarks,
    required String transId,
    required TransactionStatus status,
    required Amount balBefore,
    required Amount balAfter,
    required DateTime dateOfTrans,
    required double amount,
    required String mainTitleDisplayName,
  }) : super(
          remarks: remarks,
          transId: transId,
          type: TransactionType.credit(),
          status: status,
          balBefore: balBefore,
          balAfter: balAfter,
          dateOfTrans: dateOfTrans,
          amount: amount,
          mainTitleDisplayName: mainTitleDisplayName,
          category: TransactionCategory.addedFunds(),
        );
}
