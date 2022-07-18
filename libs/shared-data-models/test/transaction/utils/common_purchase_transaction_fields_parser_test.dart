import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_data_models/transaction/utils/common_purchase_transaction_fields_parser.dart';

import '../../raw_json_files/raw_json_reader.dart';

void main() {
  late Map<String, dynamic> json;
  late CommonPurchaseTransactionFieldsParser parser;

  setUp(() {
    json = rawJsonToMap('transactions/purchase_transaction.json');
    parser = CommonPurchaseTransactionFieldsParser(json);
    initializeDateFormatting('en');
  });

  test('should parse values correctly', () async {
    // Assert
    expect(parser.merchantName, json['merchantName']);
    expect(parser.mcc, json['mcc']);
    expect(parser.orderId, json['orderId']);
    expect(parser.transId, json['transactionId']);
    expect(parser.vat, double.parse(json['vat'].toString()));
    expect(
      parser.processingFee,
      double.parse(json['processingFee'].toString()),
    );
  });
}
