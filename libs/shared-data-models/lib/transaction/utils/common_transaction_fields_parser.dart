import 'package:shared_data_models/amount/amount.dart';

import '../transaction_status.dart';
import '../transaction_type.dart';

class CommonTransactionFieldsParser {
  final Map<String, dynamic> jsonMap;

  CommonTransactionFieldsParser(this.jsonMap);

  String get transId {
    if (jsonMap['transactionId'] != null) {
      return jsonMap['transactionId'];
    } else if (jsonMap['refundTransactionId'] != null) {
      return jsonMap['refundTransactionId'];
    }
    throw UnimplementedError('Unable to find transactionId');
  }

  DateTime get dateOfTrans {
    final formatter = DateTime.now();

    if (jsonMap['transactionDate'] != null) {
     // return formatter.parseGraphQlDateTime(jsonMap['transactionDate']);
    } else if (jsonMap['refundTransactionDate'] != null) {
     // return formatter.parseGraphQlDateTime(jsonMap['refundTransactionDate']);
    }
    throw UnimplementedError('No date found');
  }

  double get amount {
    if (jsonMap['totalTransactionAmount'] != null) {
      return Amount.fromJson(jsonMap['totalTransactionAmount']).amount;
    } else if (jsonMap['transactionAmount'] != null) {
      return double.parse(jsonMap['transactionAmount'].toString());
    } else if (jsonMap['totalRefundAmount'] != null) {
      return double.parse(jsonMap['totalRefundAmount'].toString());
    }
    throw UnimplementedError('No amount found');
  }

  Amount get balAfter => Amount.fromJson(jsonMap['balanceAfter']);

  Amount get balBefore => Amount.fromJson(jsonMap['balanceBefore']);

  String? get remarks => jsonMap['remarks'];

  TransactionStatus get status =>
      TransactionStatus.fromString(jsonMap['status']);

  TransactionType get type =>
      TransactionType.fromString(jsonMap['transactionType']);
}
