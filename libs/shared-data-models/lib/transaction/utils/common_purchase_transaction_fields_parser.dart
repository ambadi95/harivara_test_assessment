import 'common_transaction_fields_parser.dart';

class CommonPurchaseTransactionFieldsParser
    extends CommonTransactionFieldsParser {
  CommonPurchaseTransactionFieldsParser(Map<String, dynamic> jsonMap)
      : super(jsonMap);

  String get orderId {
    if (jsonMap['orderId'] != null) {
      return jsonMap['orderId'];
    } else if (jsonMap['originalTransaction'] != null) {
      return jsonMap['originalTransaction'][0]['orderId'];
    } else if (jsonMap['associatedOrderId'] != null) {
      return jsonMap['associatedOrderId'];
    }
    throw UnimplementedError('orderId not found');
  }

  String get merchantName => jsonMap['merchantName'] ?? 'N/A';

  String get mcc => jsonMap['mcc'] ?? 'N/A';

  List<String>? get refundId => jsonMap['refundId'] != null
      ? List<String>.from(jsonMap['refundId'])
      : null;

  double get processingFee => double.parse((jsonMap['processingFee'] ?? 0.0).toString());

  double? get discount => jsonMap['discount'] != null
      ? double.parse(jsonMap['discount'].toString())
      : null;

  double get vat => double.parse((jsonMap['vat'] ?? 0.0).toString());

  String get refundTransactionID => jsonMap[''].toString();

  String get associatedTransactionId =>
      (jsonMap['associatedTransactionId'] ?? 'N/A').toString();

  String get customerPhNo => (jsonMap['customerPhNo'] ?? 'N/A').toString();
}
