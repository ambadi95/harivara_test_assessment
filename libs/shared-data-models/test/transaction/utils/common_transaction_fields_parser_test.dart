import 'package:core/formatters/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/transaction/transaction_status.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';
import 'package:shared_data_models/transaction/utils/common_transaction_fields_parser.dart';

import '../../raw_json_files/raw_json_reader.dart';

void main() {
  late Map<String, dynamic> json;
  late CommonTransactionFieldsParser parser;
  late DateTimeFormatter formatter;

  setUp(() {
    formatter = DateTimeFormatter();
    json = rawJsonToMap('transactions/purchase_transaction.json');
    parser = CommonTransactionFieldsParser(json);
    initializeDateFormatting('en');
  });

  test('should parse values correctly', () async {
    // Assert
    expect(
      parser.dateOfTrans,
      formatter.parseGraphQlDateTime(json['transactionDate']),
    );
    expect(parser.balBefore, Amount.fromJson(json['balanceBefore']));
    expect(parser.balAfter, Amount.fromJson(json['balanceAfter']));
    expect(parser.remarks, json['remarks']);
    expect(parser.status, TransactionStatus.fromString(json['status']));
    expect(parser.type, TransactionType.fromString(json['transactionType']));
    expect(
      parser.amount,
      Amount.fromJson(json['totalTransactionAmount']).amount,
    );
  });
}
