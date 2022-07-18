import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_data_models/transaction/utils/common_p2p_transaction_fields_parser.dart';

import '../../raw_json_files/raw_json_reader.dart';

void main() {
  late Map<String, dynamic> json;
  late CommonP2PTransactionFieldsParser parser;

  setUp(() {
    json = rawJsonToMap('transactions/sent_funds_transaction.json');
    parser = CommonP2PTransactionFieldsParser(json);
    initializeDateFormatting('en');
  });

  test('should parse values correctly', () async {
    // Assert
    expect(parser.customerName, json['customerName']);
    expect(parser.customerPhNo, json['customerPhNo']);
    expect(parser.transId, json['transactionId']);
  });
}
