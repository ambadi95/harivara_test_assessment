import 'common_transaction_fields_parser.dart';

class CommonP2PTransactionFieldsParser extends CommonTransactionFieldsParser {
  CommonP2PTransactionFieldsParser(Map<String, dynamic> jsonMap)
      : super(jsonMap);

  String get customerName => jsonMap['customerName'] ?? 'N/A';

  String get customerPhNo => jsonMap['customerPhNo'] ?? 'N/A';
}
