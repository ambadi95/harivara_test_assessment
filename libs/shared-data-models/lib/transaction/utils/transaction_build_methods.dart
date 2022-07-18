import 'package:shared_data_models/card_wallet/card_brand.dart';
import 'package:shared_data_models/transaction/base_transactions/purchase_base_transaction.dart';
import 'package:shared_data_models/transaction/transaction.dart';
import 'package:shared_data_models/transaction/transaction_models/added_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/not_available.dart';
import 'package:shared_data_models/transaction/transaction_models/p2m.dart';
import 'package:shared_data_models/transaction/transaction_models/purchase.dart';
import 'package:shared_data_models/transaction/transaction_models/received_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/refund.dart';
import 'package:shared_data_models/transaction/transaction_models/sent_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/subscription.dart';

import 'common_p2p_transaction_fields_parser.dart';
import 'common_purchase_transaction_fields_parser.dart';
import 'common_transaction_fields_parser.dart';
import 'package:flutter/material.dart';

@protected
Transaction buildP2MTransaction(Map<String, dynamic> json) {
  final parser = CommonPurchaseTransactionFieldsParser(json);
  return P2MTransaction(
    refundTransactions: _buildRefundTransactionsIfPresent(json),
    transId: parser.transId,
    orderId: parser.orderId,
    merchantName: parser.merchantName,
    mcc: parser.mcc,
    refundId: parser.refundId,
    processingFee: parser.processingFee,
    discount: parser.discount,
    vat: parser.vat,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: 'P2M',
    refundTransactionId: parser.refundTransactionID,
    type: parser.type,
  );
}

@protected
Transaction buildPurchaseTransaction(Map<String, dynamic> json) {
  final parser = CommonPurchaseTransactionFieldsParser(json);
  return Purchase(
    refundTransactions: _buildRefundTransactionsIfPresent(json),
    transId: parser.transId,
    orderId: parser.orderId,
    merchantName: parser.merchantName,
    mcc: parser.mcc,
    refundId: parser.refundId,
    processingFee: parser.processingFee,
    discount: parser.discount,
    vat: parser.vat,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: parser.merchantName,
    refundTransactionId: parser.refundTransactionID,
    type: parser.type,
  );
}

@protected
List<Refund>? _buildRefundTransactionsIfPresent(Map<String, dynamic> json) {
  final listOfTrans = json['originalTransaction'] != null
      ? List<Refund>.from(
          json['originalTransaction']
              .map((jsonMap) => buildRefundTransaction(jsonMap)),
        )
      : null;
  if (listOfTrans != null && listOfTrans.isNotEmpty) {
    return listOfTrans;
  }
  return null;
}

@protected
Transaction buildSubscriptionTransaction(Map<String, dynamic> json) {
  final parser = CommonPurchaseTransactionFieldsParser(json);
  return Subscription(
    refundTransactions: _buildRefundTransactionsIfPresent(json),
    transId: parser.transId,
    orderId: parser.orderId,
    merchantName: parser.merchantName,
    mcc: parser.mcc,
    refundId: parser.refundId,
    processingFee: parser.processingFee,
    discount: parser.discount,
    vat: parser.vat,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: parser.merchantName,
    refundTransactionId: parser.refundTransactionID,
    type: parser.type,
  );
}

@protected
Transaction buildRefundTransaction(Map<String, dynamic> json) {
  final parser = CommonPurchaseTransactionFieldsParser(json);
  return Refund(
    originalTransaction: json['originalTransaction'] != null
        ? Transaction.fromJson(json['originalTransaction'][0])
            as PurchaseBaseTransaction
        : null,
    transId: parser.transId,
    orderId: parser.orderId,
    merchantName: parser.merchantName,
    mcc: parser.mcc,
    refundId: parser.refundId,
    processingFee: parser.processingFee,
    discount: parser.discount,
    vat: parser.vat,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: parser.merchantName,
    refundTransactionId: parser.refundTransactionID,
    associatedTransactionId: parser.associatedTransactionId,
    type: parser.type,
    customerPhNo: parser.customerPhNo,
  );
}

@protected
Transaction buildAddFundsTransaction(Map<String, dynamic> json) {
  final parser = CommonTransactionFieldsParser(json);
  return AddedFunds(
    transId: parser.transId,
    last4: json['lastFourDigit'] ?? 'N/A',
    processingFee: double.tryParse(json['processingFee'].toString()) ?? 0.0,
    brand: json['brand'] != null
        ? CardBrand.fromString(json['brand'])
        : CardBrand.unknown(),
    nickName: json['cardNickName'] ?? 'N/A',
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: json['cardNickName'] ?? 'Nickname',
  );
}

@protected
Transaction buildReceivedFundsTransaction(Map<String, dynamic> json) {
  final parser = CommonP2PTransactionFieldsParser(json);
  return ReceivedFunds(
    transId: parser.transId,
    customerPhNo: parser.customerPhNo,
    customerName: parser.customerName,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: parser.customerName,
  );
}

@protected
Transaction buildSentFundsTransaction(Map<String, dynamic> json) {
  final parser = CommonP2PTransactionFieldsParser(json);
  return SentFunds(
    transId: parser.transId,
    customerPhNo: parser.customerPhNo,
    customerName: parser.customerName,
    balBefore: parser.balBefore,
    balAfter: parser.balAfter,
    dateOfTrans: parser.dateOfTrans,
    amount: parser.amount,
    status: parser.status,
    remarks: parser.remarks,
    mainTitleDisplayName: parser.customerName,
  );
}

@protected
Transaction buildNotAvailableTransaction() {
  return NotAvailableTransaction();
}
